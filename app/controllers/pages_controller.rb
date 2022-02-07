class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if params[:query].present?
      if params[:query] == "1"
        @table_info = { table_title: "Productos mas vendidos" }
        most_selled_products
      elsif params[:query] == "2"
        @table_info = { table_title: "Ultimos productos vendidos" }
        latest_products_sold
      elsif params[:query] == "3"
        @table_info = { table_title: "Ultimos productos agregados" }
        latest_products_purchased
      end
    else
      @table_info = { table_title: "Ultimos productos vendidos" }
      latest_products_sold
    end
  end

  def movements
    # purchases
    @confirmed_purchases = Purchase.where(status: true)
    # ordenes
    @confirmed_orders = Order.where(status: true)
    @total = @confirmed_orders + @confirmed_purchases
    @total.sort_by! { |p| p.updated_at }
    @total.reverse!
  end

  def kpis
    @confirmed_orders = Order.where(status: true)
    @confirmed_purchases = Purchase.where(status: true)
    @sales = 0
    @costs = 0 
    @confirmed_orders.each do |order|    
      order.list_orders.each do |order_item| 
        @sales += order_item.product.price 
        @costs += order_item.product.cost 
      end 
    end 
  end

  private

  def most_selled_products
    @products = ListOrder.joins(:order)
                         .group(:product)
                         .where(order: { status: true})
                         .order("sum_quantity DESC")
                         .limit(5)
                         .sum(:quantity)
  end

  def latest_products_sold
    @products = ListOrder.joins(:order)
                         .includes(:product, order: [:customer])
                         .order(updated_at: :desc)
                         .limit(5).where(order: { status: true })
  end

  def latest_products_purchased
    @products = ListPurchase.joins(:purchase)
                            .includes(:product, purchase: [:supplier])
                            .order(updated_at: :desc)
                            .limit(5).where(purchase: { status: true })
  end

end

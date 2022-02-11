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
      category_sell
    end
    charts
  end

  def movements
    # purchases
    @confirmed_purchases = Purchase.where(status: true, user: current_user)
    # ordenes
    @confirmed_orders = Order.where(status: true, user: current_user)
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
        @sales += ( order_item.product.price * order_item.quantity  )
        @costs += ( order_item.product.cost * order_item.quantity )
      end
    end
    category_sell
  end



  private

  def category_sell
    @categories = ListOrder.joins(:product)
                           .group(:category)
                           .order("sum_price DESC")
                           .sum(:price)
  end

  def most_selled_products
    @products = ListOrder.joins(:order)
                         .group(:product)
                         .where(order: { status: true, user: current_user})
                         .order("sum_quantity DESC")
                         .limit(5)
                         .sum(:quantity)
  end

  def latest_products_sold
    @products = ListOrder.joins(:order)
                         .includes(:product, order: [:customer])
                         .order(updated_at: :desc)
                         .limit(5).where(order: { status: true, user: current_user })
  end

  def latest_products_purchased
    @products = ListPurchase.joins(:purchase)
                            .includes(:product, purchase: [:supplier])
                            .order(updated_at: :desc)
                            .limit(5).where(purchase: { status: true, user: current_user })
  end

  def charts
    @low_stock_count = policy_scope(Product).where('stock < minimum_required').count

    day_time = Time.now.day

    ventas = ListOrder.joins(:product).joins(:order).where(order: { user_id: current_user }).where(created_at: day_time.days.ago..Time.now).sum('(price - cost) * quantity')
    costos = ListPurchase.joins(:product).joins(:purchase).where(purchase: { user_id: current_user }).sum('cost * quantity')
    total = (ventas - costos)
    @profity = sprintf('%.2f', total)

    result = ListOrder.joins(:product).joins(:order).where(order: { user_id: current_user }).where(created_at: day_time.days.ago..Time.now).sum('price * quantity')
    @earnings = sprintf('%.2f', result)

    tickets = ListOrder.joins(:product).joins(:order).where(order: { user_id: current_user }).sum('price * quantity')
    cantidad = Order.where(user_id: current_user).count
    if tickets.zero?
      @average_ticket = "S/. 0.00"
    else
      division = (tickets  / cantidad)
      @average_ticket = "S/. #{sprintf('%.2f', division)}"
    end
  end
end

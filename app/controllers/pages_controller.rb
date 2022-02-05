class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if params[:query].present?
      if params[:query] == '2'
        @products = Product.all.order(stock: :asc).limit(5)
      elsif params[:query] == '3'
        @products = Product.all.order(stock: :desc).limit(5)
      else
        @products = Product.all.sort_by { |product| -product.list_orders.sum(:quantity) }.take(5)
      end
    else
      @products = ListOrder.joins(:order)
                           .includes(:product, order: [:customer])
                           .order(updated_at: :desc)
                           .limit(5).where(order: { status: true })
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
end

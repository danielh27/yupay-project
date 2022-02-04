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
      @products = Product.all.limit(5)
    end
  end

  def movements
    # variables pasadas
    # @list_purchases = ListPurchase.includes(:purchase)
    # @confirmed_lists = @list_purchases.select {|list| list.purchase.status = true }

    # purchases
    @confirmed_purchases = Purchase.where(status: true)
    # ordenes
    @confirmed_orders = Order.where(status: true)

  end
end

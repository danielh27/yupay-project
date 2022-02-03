class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @products = Product.all
    if params[:query].present?
      if params[:query] == '2'
        @products = Product.all.order(stock: :asc).take(5)
      elsif params[:query] == '3'
        @products = Product.all.order(stock: :desc).take(5)
      else
        @products = Product.all.sort_by { |product| -product.list_orders.sum(:quantity) }.take(5)
      end
    else
      @products = Product.all
    end
  end

  def movements
    @list_purchases = ListPurchase.includes(:purchase)
    @confirmed_lists = @list_purchases.select {|list| list.purchase.status = true }
    # purchases
    
    @confirmed_purchases = Purchase.where(status: true)
  end
end

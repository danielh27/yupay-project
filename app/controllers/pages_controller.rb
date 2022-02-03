class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
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

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
  end

  def movements
    @list_purchases = ListPurchase.includes(:purchase)
    @confirmed_lists = @list_purchases.select {|list| list.purchase.status = true }
    # purchases
    
    @confirmed_purchases = Purchase.where(status: true)
  end
end

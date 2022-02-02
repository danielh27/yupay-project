class PurchasesController < ApplicationController

  def new
  end

  def create
    purchase = Purchase.new
    purchase.supplier = Supplier.first
    if purchase.save!
      redirect_to new_purchase_list_purchase_path(purchase)
    end
  end

  def show
  end
end

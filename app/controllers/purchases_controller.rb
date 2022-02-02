class PurchasesController < ApplicationController

  def new
    @pending_purchases = Purchase.where(status: false)
  end

  def create
    purchase = Purchase.new(supplier: Supplier.first, user: current_user, status: false)
    if purchase.save
      redirect_to new_purchase_list_purchase_path(purchase)
    end
  end

  def confirm
    purchase = Purchase.find(params[:id])
    purchase.status = true
    purchase.save
    redirect_to purchase_path(purchase)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def destroy
    purchase = Purchase.find(params[:id])
    purchase.destroy
    redirect_to new_purchase_path
  end
end

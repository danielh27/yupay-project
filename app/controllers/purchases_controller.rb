class PurchasesController < ApplicationController

  def new
    @pending_purchases = Purchase.where(status: false)
  end

  def create
    purchase = Purchase.new(supplier: Supplier.first, user: current_user, status: false)
    if purchase.save
      redirect_to purchase_list_purchases_path(purchase)
    end
  end

  def confirm
    purchase = Purchase.find(params[:id])
    increase_stock(purchase)
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

  private

  def increase_stock(purchase)
    purchase.list_purchases.each do |item|
      p item.product.stock
      item.product.stock += item.quantity
      item.product.save!
      p item.product.stock
    end
  end
end

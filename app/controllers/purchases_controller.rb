class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @pending_purchases = Purchase.where(status: false)
    @supplier = Supplier.new
  end

  def create
    purchase = Purchase.new(purchase_params)
    purchase.user = current_user
    purchase.status = false
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

  def purchase_params
    params.require(:purchase).permit(:supplier_id)
  end

  def increase_stock(purchase)
    purchase.list_purchases.each do |item|
      item.product.stock += item.quantity
      item.product.save
    end
  end
end

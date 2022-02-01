class ListPurchasesController < ApplicationController

  def new
    @list_purchase = ListPurchase.new
    @list_purchases = ListPurchase.where(purchase: params[:purchase_id])
  end

  def create
    purchase = Purchase.find(params[:purchase_id])
    @list_purchase = ListPurchase.new(list_purchase_params)
    @list_purchase.purchase = purchase
    if @list_purchase.save!
      redirect_to new_purchase_list_purchase_path(purchase)
    else
      render :new
    end
  end

  private

  def list_purchase_params
    params.require(:list_purchase).permit(:product_id, :quantity)
  end
end

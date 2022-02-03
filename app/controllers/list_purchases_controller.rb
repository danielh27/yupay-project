class ListPurchasesController < ApplicationController

  def new
  end

  def index
    @list_purchase = ListPurchase.new
    @list_purchases = ListPurchase.where(purchase: params[:purchase_id])
    @purchase = Purchase.find(params[:purchase_id])
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    @list_purchase = ListPurchase.new(list_purchase_params)
    @list_purchases = ListPurchase.where(purchase: params[:purchase_id])
    @list_purchase.purchase = @purchase
    if @list_purchase.save
      redirect_to purchase_list_purchases_path(@purchase)
    else
      render :index
    end
  end

  def destroy
    list_purchase = ListPurchase.find(params[:id])
    list_purchase.destroy
    redirect_to purchase_list_purchases_path(list_purchase.purchase.id)
  end

  private

  def list_purchase_params
    params.require(:list_purchase).permit(:product_id, :quantity)
  end
end

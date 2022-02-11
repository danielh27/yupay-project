class ListPurchasesController < ApplicationController

  def new
  end

  def index
    @list_purchase = ListPurchase.new

    @purchase = Purchase.find(params[:purchase_id])

    @list_purchases = policy_scope(ListPurchase).includes(:product).where(purchase: params[:purchase_id])

    @products = policy_scope(Product).order(price: :desc)

    @total_sum = @list_purchases.select(:cost, :quantity).sum("cost * quantity").round(2)
    @total_sum = sprintf("%.2f", @total_sum)

    if params[:query].present?
      @products = policy_scope(Product).where('name ILIKE :query OR bar_code ILIKE :query', query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "results.html" }
    end
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    @list_purchase = ListPurchase.new(list_purchase_params)
    @list_purchase.purchase = @purchase
    @product = @list_purchase.product

    @list_purchases = ListPurchase.includes(:product).where(purchase: params[:purchase_id])

    total_sum = @list_purchases.select(:cost, :quantity).sum("cost * quantity") + (@product.cost * @list_purchase.quantity)
    @total_sum = sprintf('%.2f', total_sum)

    authorize @list_purchase

    respond_to do |format|
      if @list_purchase.save
        format.html { redirect_to purchase_list_purchases_path(@purchase) }
      else
        format.html { render :index }
      end
      format.json
    end

  end

  def destroy
    list_purchase = ListPurchase.find(params[:id])
    authorize list_purchase
    list_purchase.destroy
    redirect_to purchase_list_purchases_path(list_purchase.purchase.id)
  end

  private

  def list_purchase_params
    params.require(:list_purchase).permit(:product_id, :quantity)
  end
end

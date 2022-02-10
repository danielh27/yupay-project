class ListOrdersController < ApplicationController
  def index
    @list_order = ListOrder.new
    # @list_orders = ListOrder.includes(:product).where(order: params[:order_id])
    @list_orders = policy_scope(ListOrder).includes(:product).where(order: params[:order_id])
    @order = Order.find(params[:order_id])
    @products = policy_scope(Product).order(price: :desc)
    @total_sum = @list_orders.select(:price, :quantity).sum("price * quantity").round(2)

    if params[:query].present?
      @products = policy_scope(Product).where('name ILIKE :query OR bar_code ILIKE :query', query: "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "results.html" }
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @list_order = ListOrder.new(list_order_params)
    @list_orders = ListOrder.includes(:product).where(order: params[:order_id])
    @list_order.order = @order
    @product = @list_order.product

    total_sum = @list_orders.select(:price, :quantity).sum("price * quantity") +  (@product.price * @list_order.quantity)
    @total_sum = sprintf('%.2f', total_sum)

    authorize @list_order

    respond_to do |format|
      if @list_order.save
        format.html { redirect_to order_list_orders_path(@order) }
      else
        format.html { render :index }
      end
      format.json
    end
  end

  def destroy
    order_item = ListOrder.find(params[:id])
    authorize order_item
    order_item.destroy
    redirect_to order_list_orders_path(order_item.order)
  end

  private

  def list_order_params
    params.require(:list_order).permit(:quantity, :product_id)
  end
end

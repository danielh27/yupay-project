class ListOrdersController < ApplicationController
  def index
    @list_order = ListOrder.new
    @list_orders = ListOrder.where(order: params[:order_id])
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.find(params[:order_id])
    @list_order = ListOrder.new(list_order_params)
    @list_orders = ListOrder.where(order: params[:order_id])
    @list_order.order = @order
    if @list_order.save
      redirect_to order_list_orders_path(@order)
    else
      render :index
    end
  end

  def destroy
    order_item = ListOrder.find(params[:id])
    order_item.destroy
    redirect_to order_list_orders_path(order_item.order)
  end

  private

  def list_order_params
    params.require(:list_order).permit(:quantity, :product_id)
  end
end

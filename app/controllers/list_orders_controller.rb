class ListOrdersController < ApplicationController
  def new
    @list_order = ListOrder.new
    @list_order = ListOrder.where(order: params[:order_id])
  end

  def create
    order = Order.find(params[:order_id])
    @list_order = ListOrder.new(list_order_params)
    @list_order.order = order
    if @list_order.save!
      redirect_to new_order_list_order_path(order)
    else
      render :new
    end
  end

  private

  def list_order_params
    params.require(:list_order).permit(:quantity, :product_id)
  end
end

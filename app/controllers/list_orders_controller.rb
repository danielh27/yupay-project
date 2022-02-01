class ListOrdersController < ApplicationController
  def new
    @list_order = ListOrder.new
  end

  def create
    order = Order.new
    order.customer = Customer.first
    @list_order = ListOrder.new(list_order_params)
    @list_order.order = order
    @list_order.save!
    # if @list_order.save
    #    redirect_to list_orders_path
    # else
    #   render :new
    # end
  end

  private

  def list_order_params
    params.require(:list_order).permit(:quantity, :product_id)
  end
end

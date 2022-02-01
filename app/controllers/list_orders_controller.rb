class ListOrdersController < ApplicationController
  def new
    @list_order = ListOrder.new
  end

  def create
    # @product = Product.find(params[:product_id])
    # @order = Order.find(params[:order_id])
    # @list_order = List_order.new(lis_order_params)
    # @list_order.product = @product
    # @list_order.order = @order
    # if @list_order.save
    #   redirect_to orders_new_products_path
    # else
    #   render :new
    # end
  end

  private

  def list_order_params
    params.require(:list_order).permit(:quantity)
  end
end

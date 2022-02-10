class OrdersController < ApplicationController
  def new
    @unconfirmed_orders = Order.where(status: false, user: current_user)
    @order = Order.new
    @customer = Customer.new
    authorize @unconfirmed_orders
  end

  def create
    order = Order.new(order_params)
    order.user = current_user
    authorize order
    order.status = false
    if order.save!
      redirect_to order_list_orders_path(order)
    end
  end

  def confirm
    order = Order.find(params[:id])
    authorize order
    decrease_stock(order)
    order.status = true
    order.save
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find(params[:id])
    authorize order
    order.destroy
    redirect_to new_order_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :customer_id)
  end

  def decrease_stock(order)
    order.list_orders.each do |item|
      item.product.stock -= item.quantity
      item.product.save
    end
  end
end

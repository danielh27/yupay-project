class OrdersController < ApplicationController
  def new
    @unconfirmed_orders = Order.where(status: false)
  end

  def create
    order = Order.new(customer: Customer.first)
    order.user = current_user
    order.status = false
    if order.save!
      redirect_to order_list_orders_path(order)
    end
  end

  def show
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to new_order_path
  end
end

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

  def confirm
    order = Order.find(params[:id])
    descrease_stock(order)
    order.status = true
    order.save
    redirect_to order_path(order)
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to new_order_path
  end

  private

  def decrease_stock(order)
    order.list_orders.each do |item|
      item.product.stock -= item.quantity
      item.product.save
    end
  end
end

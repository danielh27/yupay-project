class OrdersController < ApplicationController
  def new
  end

  def create
    order = Order.new
    order.customer = Customer.first
    if order.save!
      redirect_to new_order_list_order_path(order)
    end
  end

  def show
  end
end

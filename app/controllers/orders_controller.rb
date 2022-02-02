class OrdersController < ApplicationController
  def new
  end

  def create
    order = Order.new(customer: Customer.first, user: current_user)
    if order.save!
      redirect_to new_order_list_order_path(order)
    end
  end

  def show
  end
end

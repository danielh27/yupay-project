class CustomersController < ApplicationController
  def create
    customer = Customer.new(customer_params)
    customer.user = current_user
    customer.save
    authorize customer
    redirect_to new_order_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address)
  end
end

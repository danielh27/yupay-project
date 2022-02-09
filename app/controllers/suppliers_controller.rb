class SuppliersController < ApplicationController
  def create
    supplier = Supplier.new(supplier_params)
    supplier.user = current_user
    supplier.save
    authorize supplier
    redirect_to new_purchase_path
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :addres, :tax_code)
  end
end

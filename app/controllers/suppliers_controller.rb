class SuppliersController < ApplicationController
  def create
    Supplier.create(supplier_params)
    redirect_to new_purchase_path
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end

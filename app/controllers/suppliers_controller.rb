class SuppliersController < ApplicationController
  def create
    supplier = Supplier.create(supplier_params)
    authorize supplier
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end

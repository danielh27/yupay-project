class SuppliersController < ApplicationController
  def create
    Supplier.create(supplier_params)
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end

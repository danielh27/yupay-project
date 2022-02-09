class AddTaxCodeToSuppliers < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :tax_code, :integer
  end
end

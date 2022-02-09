class AddAddressToSuppliers < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :address, :string
  end
end

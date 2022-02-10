class ChangeTaxCodeFromIntegerToString < ActiveRecord::Migration[6.1]
  def change
    change_column :suppliers, :tax_code, :string
  end
end

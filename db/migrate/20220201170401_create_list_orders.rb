class CreateListOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :list_orders do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end

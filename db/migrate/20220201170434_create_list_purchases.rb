class CreateListPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :list_purchases do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end

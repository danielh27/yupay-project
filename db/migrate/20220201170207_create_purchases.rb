class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.boolean :status
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end

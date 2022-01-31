class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :size
      t.float :price
      t.integer :stock
      t.string :bar_code
      t.integer :minimun_required
      t.float :cost
      t.boolean :visible, default: true
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end

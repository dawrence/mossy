class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies do |t|
      t.string     :name, null: false
      t.integer    :sale_point_id
      t.string     :description, default: nil
      t.integer    :supply_category_id, null: false
      t.timestamps
    end
    add_index :supplies, :sale_point_id
    add_index :supplies, :supply_category_id
  end
end

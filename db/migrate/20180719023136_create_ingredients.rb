class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer  :recipe_id, null: false
      t.integer  :supply_id, null: false
      t.string   :magnitude
      t.integer  :amount, default: 0
      t.timestamps
    end
  end
end

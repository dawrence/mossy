class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.integer :product_id, null: false
      t.string  :description, default: nil
      t.timestamps
    end
    add_index :recipes, :product_id
  end
end

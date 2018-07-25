class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string     :name, null: false
      t.string     :description, default: nil
      t.integer    :sale_point_id
      t.integer    :product_category_id, null: false
      t.float      :price, default: 0
      t.boolean    :published
      t.datetime   :published_at
      t.datetime   :published_until
      t.timestamps
    end
    add_index :products, :sale_point_id
    add_index :products, :product_category_id
  end
end

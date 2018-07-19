class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string     :name, null: false
      t.string     :description, default: nil
      t.integer    :category_id, null: false
      t.float      :price, default: 0
      t.boolean    :published
      t.datetime   :published_at
      t.datetime   :published_until
      t.timestamps
    end
  end
end

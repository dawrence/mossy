class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies do |t|
      t.string     :name, null: false
      t.string     :description, default: nil
      t.integer    :category_id, null: false
      t.timestamps
    end
  end
end

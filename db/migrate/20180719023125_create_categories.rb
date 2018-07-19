class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string   :type, null: false
      t.string   :name, null: false
      t.string   :description, default: nil
      t.boolean  :published, default: true
      t.datetime :published_at
      t.datetime :published_until
      t.timestamps
    end
  end
end

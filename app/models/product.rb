class Product < ApplicationRecord
  validates :name, :product_category_id, :sale_point_id, presence: true
  validates :name, uniqueness: true

  belongs_to :product_category

  has_one :recipe
  has_many :ingredients, through: :recipe
end

# == Schema Information
#
# Table name: products
#
#  id                  :bigint(8)        not null, primary key
#  name                :string           not null
#  description         :string
#  sale_point_id       :integer
#  product_category_id :integer          not null
#  price               :float            default(0.0)
#  published           :boolean
#  published_at        :datetime
#  published_until     :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

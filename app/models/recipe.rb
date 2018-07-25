class Recipe < ApplicationRecord
  validates :product_id, presence: true

  belongs_to :product

  has_many :ingredients
  has_many :supplies, through: :ingredients
end

# == Schema Information
#
# Table name: recipes
#
#  id          :bigint(8)        not null, primary key
#  product_id  :integer          not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

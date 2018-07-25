class Ingredient < ApplicationRecord
  validates :amount, :recipe_id, :supply_id, presence: true
  validates :magnitude, inclusion: { in: %w[kg g l oz lb cc]}

  belongs_to :recipe
  belongs_to :supply
end

# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint(8)        not null, primary key
#  recipe_id  :integer          not null
#  supply_id  :integer          not null
#  magnitude  :string
#  amount     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

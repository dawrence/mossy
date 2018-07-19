FactoryBot.define do
  factory :ingredient do
    recipe_id { FactoryBot.create(:recipe).id }
    supply_id { FactoryBot.create(:supply).id }
  end
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

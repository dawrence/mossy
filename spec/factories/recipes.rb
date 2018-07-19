FactoryBot.define do
  factory :recipe do
    product_id { FactoryBot.create(:product).id }
    description { Faker::RickAndMorty.quote }
  end
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

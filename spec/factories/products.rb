FactoryBot.define do
  factory :product do
    name  { Faker::Hipster.name }
    price { Faker::Commerce.price.to_f }
    product_category_id { FactoryBot.create(:product_category).id }
    sale_point_id 1

    trait :published do
      published true
      published_at { Time.zone.now }
    end

  end
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

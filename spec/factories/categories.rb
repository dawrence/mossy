FactoryBot.define do
  factory :category do
    name        { Faker::Hipster.word }
    description { Faker::Hipster.word }
    sale_point_id { 1 }
    trait :published do
      published true
      published_at { Time.zone.now }
    end
  end

  factory :supply_category, parent: :category, class: 'SupplyCategory' do
  end

  factory :product_category, parent: :category, class: 'ProductCategory' do
  end
end

# == Schema Information
#
# Table name: categories
#
#  id              :bigint(8)        not null, primary key
#  type            :string           not null
#  name            :string           not null
#  sale_point_id   :integer
#  description     :string
#  published       :boolean          default(TRUE)
#  published_at    :datetime
#  published_until :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

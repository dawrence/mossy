FactoryBot.define do
  factory :category do
    name        { Faker::Restaurant.type }
    description { Faker::Restaurant.review }

    trait :published do
      published true
      published_at { Time.zone.now }
    end
  end
end

# == Schema Information
#
# Table name: categories
#
#  id              :bigint(8)        not null, primary key
#  type            :string           not null
#  name            :string           not null
#  description     :string
#  published       :boolean          default(TRUE)
#  published_at    :datetime
#  published_until :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

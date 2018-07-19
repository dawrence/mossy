FactoryBot.define do
  factory :supply do
    name        { Faker::Restaurant.name }
    description { Faker::RickAndMorty.quote }
  end
end

# == Schema Information
#
# Table name: supplies
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :string
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

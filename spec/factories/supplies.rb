FactoryBot.define do
  factory :supply do
    name        { Faker::Hipster.word }
    description { Faker::RickAndMorty.quote }
    sale_point_id 1
    supply_category_id { FactoryBot.create(:supply_category).id }
  end
end

# == Schema Information
#
# Table name: supplies
#
#  id                 :bigint(8)        not null, primary key
#  name               :string           not null
#  sale_point_id      :integer
#  description        :string
#  supply_category_id :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

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

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:subject) { FactoryBot.create(:product) }

  context 'Validations' do
    it 'validates presence of name' do
      expect(subject).to validate_presence_of(:name)
    end

    it 'validates presence of sale point' do
      expect(subject).to validate_presence_of(:sale_point_id)
    end

    it 'validates presence of product_category_id' do
      expect(subject).to validate_presence_of(:product_category_id)
    end

    it 'validates uniqueness of name' do
      expect(subject).to validate_uniqueness_of(:name)
    end
  end

  context 'Associations' do
    it 'has one recipe' do
      expect(subject).to have_one(:recipe)
    end

    it 'belong to a Product Category' do
      expect(subject).to belong_to(:product_category)
    end

    it 'has_many Ingredients through Recipe' do
      expect(subject).to have_many(:ingredients).through(:recipe)
    end
  end
end

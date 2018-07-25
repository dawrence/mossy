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

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:subject) { FactoryBot.create(:recipe) }

  context 'Validations' do
    it 'validates presence of product_id' do
      expect(subject).to validate_presence_of(:product_id)
    end
  end

  context 'Associations' do
    it 'belong to product' do
      expect(subject).to belong_to(:product)
    end

    it 'has many ingredients' do
      expect(subject).to have_many(:ingredients)
    end

    it 'has many supplies through ingredients' do
      expect(subject).to have_many(:supplies).through(:ingredients)
    end
  end
end

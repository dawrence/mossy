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

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:subject) { FactoryBot.create(:ingredient) }
  context 'validations' do
    it 'validate presence of recipe_id, supply_id' do
      expect(subject).to validate_presence_of(:recipe_id)
      expect(subject).to validate_presence_of(:supply_id)
      expect(subject).to validate_presence_of(:amount)
    end

    it 'magnitude in desired values' do
      expect(subject).to(
        validate_inclusion_of(:magnitude).
        in_array(%w[kg g l oz lb cc])
      )
    end
  end

  context 'Associations' do
    it 'belongs to Supply' do
      expect(subject).to belong_to(:supply)
    end

    it 'belongs to Recipe' do
      expect(subject).to belong_to(:recipe)
    end
  end
end

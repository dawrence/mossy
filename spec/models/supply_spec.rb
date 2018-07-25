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

require 'rails_helper'

RSpec.describe Supply, type: :model do
  let(:subject) { FactoryBot.create(:supply) }

  context 'Validations' do
    it 'invalid when name is nill' do
      s = FactoryBot.build(:supply, name: nil)
      expect(s).to be_invalid
    end

    it 'invalid when sale_point_id is nil' do
      s = FactoryBot.build(:supply, sale_point_id: nil)
      expect(s).to be_invalid
    end

    it 'invalid when sale_point_id is nil' do
      s = FactoryBot.build(:supply, sale_point_id: nil)
      expect(s).to be_invalid
    end

    it 'invalid when supply_category_id is nil' do
      s = FactoryBot.build(:supply, supply_category_id: nil)
      expect(s).to be_invalid
    end

    it 'invalid when name its duplicated' do
      s = FactoryBot.build(:supply, sale_point_id: nil)
      expect(s).to be_invalid
    end
  end

  context 'Associations' do
    it 'Belongs to Supply Category' do
      expect(subject).to belong_to(:supply_category)
    end
  end
end

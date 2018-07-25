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

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:subject) { FactoryBot.create(:product_category) }

  context 'creation' do
    it 'creates a SupplyCategory' do
      category = FactoryBot.build(:supply_category)
      expect(category.class.name).to eq('SupplyCategory')
    end

    it 'creates a ProductCategory' do
      category = FactoryBot.build(:product_category)
      expect(category.class.name).to eq('ProductCategory')
    end
  end

  context 'Validations' do
    it 'invalid by null name' do
      cat = FactoryBot.build(:product_category, name: nil)
      expect(cat).to be_invalid
    end

    it 'invalid by duplicated name' do
      cat = FactoryBot.build(:product_category, name: subject.name)
      expect(cat).to be_invalid
    end

    it 'invalid by null sale_point_id' do
      cat = FactoryBot.build(:product_category, sale_point_id: nil)
      expect(cat).to be_invalid
    end

    it 'valid with all options' do
      expect(subject).to be_valid
    end
  end

  context 'Associations' do
    context 'SupplyCategory' do
      let(:subject) { FactoryBot.build(:supply_category) }
      it 'do not have products' do
        expect(subject).not_to have_many(:products)
      end

      it 'Has many supplies' do
        expect(subject).to have_many(:supplies)
      end
    end

    context 'ProductCategory' do
      let(:subject) { FactoryBot.build(:product_category) }
      it 'do not have many supplies' do
        expect(subject).not_to have_many(:supplies)
      end

      it 'Has many products' do
        expect(subject).to have_many(:products)
      end
    end
  end

  describe '#available?' do
    it 'its true' do
      c = FactoryBot.build(:product_category, :published)
      expect(c.available?).to eq(true)
    end

    it 'its false due not published' do
      c = FactoryBot.build(:product_category, published: false)
      expect(c.available?).to eq(false)
    end

    it 'its false due not in date' do
      c = FactoryBot.build(:product_category,
                            published: true,
                            published_at: Time.zone.now - 2.day,
                            published_until: Time.zone.now - 1.day
                           )
      expect(c.available?).to eq(false)
    end
  end
end

class Supply < ApplicationRecord
  validates :name, :sale_point_id, :supply_category_id, presence: true
  validates :name, uniqueness: true

  belongs_to :supply_category
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

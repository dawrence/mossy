class Supply < ApplicationRecord
  belongs_to :supply_category
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

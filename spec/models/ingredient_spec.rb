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
  pending "add some examples to (or delete) #{__FILE__}"
end

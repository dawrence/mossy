# == Schema Information
#
# Table name: products
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  description     :string
#  category_id     :integer          not null
#  price           :float            default(0.0)
#  published       :boolean
#  published_at    :datetime
#  published_until :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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

require 'rails_helper'

RSpec.describe Supply, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

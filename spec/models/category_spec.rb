# == Schema Information
#
# Table name: categories
#
#  id              :bigint(8)        not null, primary key
#  type            :string           not null
#  name            :string           not null
#  description     :string
#  published       :boolean          default(TRUE)
#  published_at    :datetime
#  published_until :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

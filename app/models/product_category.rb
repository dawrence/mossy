class ProductCategory < Category
  has_many :products
end

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

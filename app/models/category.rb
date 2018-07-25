class Category < ApplicationRecord
  validates :name, :sale_point_id, presence: true
  validates :name, uniqueness: true

  def available?
    return false unless published?
    return true if published_at <= Time.zone.now and published_until.nil?
    Time.zone.now.between?(published_at, published_until)
  end
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

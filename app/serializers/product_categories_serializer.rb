class ProductCategorySerializer < ActiveModel::Serializer
  attributes :name, :description, :available

  def available
    object.available?
  end
end

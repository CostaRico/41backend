class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :price, :category_name

  has_one :values, serializer: ValueSerializer

  def category_name
    object.category.name
  end
end

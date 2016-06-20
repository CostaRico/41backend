class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :price, :category_name

  has_many :values, each_serializer: ValueSerializer

  def category_name
    object.category.name
  end
end

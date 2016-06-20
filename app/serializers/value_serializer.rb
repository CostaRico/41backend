class ValueSerializer < ActiveModel::Serializer
  attributes :property, :value

  def property
    object.property.title
  end
end

class ProductProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :product
  belongs_to :value

  def values
    property.values
  end
end

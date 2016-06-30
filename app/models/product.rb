class Product < ActiveRecord::Base
  belongs_to :category
  has_many :properties, through: :category # Brand or color
  has_many :all_values, class_name: 'Value',
                        through: :properties,
                        source: :values # property_id & value_id
  has_many :productvalues, class_name: 'Productvalue' # property_id & value_id
  has_many :values, through: :productvalues # property_id & value_id
  belongs_to :brand
  has_many :product_properties
  has_many :prop_values, class_name: 'ProductProperty', dependent: :destroy
  accepts_nested_attributes_for :values, :product_properties, allow_destroy: true
end

class Property < ActiveRecord::Base
  has_many :category_properties
  has_many :categories, through: :category_properties
  has_many :values
end

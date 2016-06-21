class Category < ActiveRecord::Base
  has_many :products
  has_many :categories
  belongs_to :category
  has_many :category_properties
  has_many :properties, through: :category_properties
  accepts_nested_attributes_for :properties
end

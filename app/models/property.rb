class Property < ActiveRecord::Base
  has_and_belongs_to_many :category
  has_many :values
end

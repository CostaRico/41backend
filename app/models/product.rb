# t.string   "title"
# t.text     "text"
# t.decimal  "price"
# t.integer  "category_id"

class Product < ActiveRecord::Base
  belongs_to :category
  has_many :properties, through: :category #Бренд или Цвет
  has_many :all_values, class_name: "Value", through: :properties, source: :values # property_id & value_id
  has_many :productvalues, class_name: "Productvalue" # property_id & value_id
  has_many :values, through: :productvalues # property_id & value_id
  accepts_nested_attributes_for :values
end


# productvalues_attributes ( [ { value_id: 3, property_id: 9 }, {  } )

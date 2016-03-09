# t.string   "name"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
class Category < ActiveRecord::Base
  has_many :products
  has_and_belongs_to_many :properties
  accepts_nested_attributes_for :properties
end

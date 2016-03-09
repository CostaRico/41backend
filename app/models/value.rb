class Value < ActiveRecord::Base
  belongs_to :property
  has_many :productvalues
  has_many :products, through: :productvalues
end

class Value < ActiveRecord::Base
  belongs_to :property
  has_many :productvalues
  has_many :products, through: :productvalues
  has_many :product_properties
  has_many :prop_values, class_name: 'ProductProperty', dependent: :destroy

  def self.product_ids arr
    arr.map do |arr|
     find(arr).product_ids
    end.reduce :&
  end
end

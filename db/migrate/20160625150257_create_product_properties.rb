class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.references :property, index: true
      t.references :product, index: true
      t.references :value, index: true
      t.string :man_value

      t.timestamps null: false
    end
    add_foreign_key :product_properties, :properties
    add_foreign_key :product_properties, :products
  end
end

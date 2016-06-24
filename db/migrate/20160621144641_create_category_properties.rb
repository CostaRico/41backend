class CreateCategoryProperties < ActiveRecord::Migration
  def change
    create_table :category_properties do |t|
      t.references :category, index: true
      t.references :property, index: true

      t.timestamps null: false
    end
    add_foreign_key :category_properties, :categories
    add_foreign_key :category_properties, :properties
  end
end

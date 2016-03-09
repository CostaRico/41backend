class CreateCategoryPropertyJoinTable < ActiveRecord::Migration
  def change
    create_table 'categories_properties', id: false do |t|
      t.column 'category_id', :integer
      t.column 'property_id', :integer
    end
  end
end

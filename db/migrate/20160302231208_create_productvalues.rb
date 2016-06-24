class CreateProductvalues < ActiveRecord::Migration
  def change
    create_table :productvalues, id: false do |t|
      t.integer :product_id
      t.integer :value_id
      t.string :manual_value

      t.timestamps null: false
    end
  end
end

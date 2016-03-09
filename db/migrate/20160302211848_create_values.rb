class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :value
      t.references :property, index: true

      t.timestamps null: false
    end
    add_foreign_key :values, :properties
  end
end

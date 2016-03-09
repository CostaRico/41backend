class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :properties, :categories
  end
end

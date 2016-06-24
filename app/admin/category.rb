ActiveAdmin.register Category do
# t.string   "name"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# permit_params :list, :of, :attributes, :on, :model
permit_params :name, property_ids: []

  form do |f|
    f.actions
    f.inputs 'Categories / Properties' do
      f.input :name
      f.input :properties, as: :check_boxes, input_html: { multiple: true }
    end
    f.actions
  end
  # show do
  #   h3 category.name
  #   div do
  #     simple_format category.categories
  #   end
  # end
end

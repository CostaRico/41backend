ActiveAdmin.register Product do
permit_params :title, :text, :price, :category_id, :brand_id, value_ids:[]
config.filters = false # unless error

  form do |f|
    f.actions
    f.inputs 'about' do
      f.input :title
      f.input :text
      f.input :brand
      f.input :category
      f.input :values, as: :check_boxes, input_html: { multiple: true },
          label: f.object.properties.map(&:title).join(', ')
      # f.fields_for :properties do |p|
      #   p.input :value, :as => :select, :input_html => {:multiple => true}
      # end
      f.input :price
    end
    f.inputs 'about' do
      f.input :properties, as: :check_boxes, input_html: { multiple: true }
    end
    f.actions
  end
end

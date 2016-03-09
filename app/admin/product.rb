ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :text, :price, :category_id, value_ids:[]
config.filters = false

  form do |f|
    f.actions
    f.inputs 'Hey Fuck Off' do
      f.input :title
      f.input :text
      f.input :category
      f.input :values, :as => :check_boxes, :input_html => {:multiple => true},
          label: f.object.properties.map(&:title).join(', ')
      # f.fields_for :properties do |p|
      #   p.input :value, :as => :select, :input_html => {:multiple => true}
      # end
      f.input :price
    end
    p '12'
    f.inputs 'Hey Fuck Off' do
      f.input :properties, :as => :select, :input_html => {:multiple => true}
    end
    f.actions
  end


end

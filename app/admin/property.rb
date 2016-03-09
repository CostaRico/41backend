ActiveAdmin.register Property do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, category_ids: []

  form do |f|
    f.actions
    f.inputs 'Properties / Categories' do
      f.input :title
      f.input :category, :as => :check_boxes, :input_html => {:multiple => true}
    end
    f.actions
  end



end

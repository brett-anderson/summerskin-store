ActiveAdmin.register Product do
  config.batch_actions = true
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details", :multipart => true do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :picture
      f.input :category
      f.input :sale
    end
    f.buttons 
  end  

  index do
    column :id 
    column :name
    column :description
    column :price
    column :quantity
    default_actions
  end
end

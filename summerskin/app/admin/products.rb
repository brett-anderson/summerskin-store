ActiveAdmin.register Product do
  form :html => { :enctype => 'multipart/form-data' } do |f|
    f.inputs "Details", :multipart => true do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :picture
    end
    f.buttons 
  end  

  index do
    column :id
    column :name
    column :description
    column :price
    column :quantity
  end
end

ActiveAdmin.register Page do
  form do |f|
    f.inputs do
      f.input :title
      f.input :content
    end

    f.buttons
  end
end
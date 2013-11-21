class Product < ActiveRecord::Base
  attr_accessible :description, 
                  :name, 
                  :price, 
                  :quantity, 
                  :picture,
                  :picture_file_name, 
                  :picture_content_type, 
                  :picture_file_size, 
                  :picture_updated_at

  has_attached_file :picture, 
                    :styles => { :medium => "300x300>", 
                                 :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png"

  validates :picture, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture
end

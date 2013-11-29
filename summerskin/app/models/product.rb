class Product < ActiveRecord::Base
  attr_accessible :description, 
                  :name, 
                  :price, 
                  :quantity, 
                  :picture,
                  :category_id,
                  :picture_file_name, 
                  :picture_content_type, 
                  :picture_file_size, 
                  :picture_updated_at


  has_attached_file :picture, 
                    :styles => { :medium => "300x300>", 
                                 :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png"

  validates :picture, :attachment_presence => true
  validates :name, :description, :price, :picture, :presence => true
  validates :price, :numericality => true
  validates_with AttachmentPresenceValidator, :attributes => :picture
  belongs_to :category
  has_many :line_items
  has_many :orders, :through => :line_items

end

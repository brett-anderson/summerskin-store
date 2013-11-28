class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst_rate, :hst_rate, :pst_rate, :status

  has_many :line_items
  has_many :products, :through => :line_items
  belongs_to :customer
end

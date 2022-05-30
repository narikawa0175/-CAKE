class Item < ApplicationRecord
 has_one_attached:image
 has_many :order_datails,dependent: :destroy
 has_many :cart_items,dependent: :destroy
 belongs_to :genre
 
 def add_tax_price
  (self.price*1.1).round
 end
end

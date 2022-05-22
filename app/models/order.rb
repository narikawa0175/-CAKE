class Order < ApplicationRecord
 belongs_to :customer
 has_many :order_datails,dependent: :destroy
 
 enum method_of_payment:{credit_card:0,transfer:1}
 enum making_status:{waiting:0,confirmation:1,production:2,preparing:3,shipped:4}
end

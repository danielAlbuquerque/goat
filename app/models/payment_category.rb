class PaymentCategory < ActiveRecord::Base
  has_many :bill_to_pays
  has_many :bill_to_receives
  
  validates_presence_of :description
end

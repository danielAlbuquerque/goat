class PaymentCategory < ActiveRecord::Base
  has_many :bill_to_pays
  has_many :bill_to_receives
  validates :description, presence: true, length: {in: 2..50}
  acts_as_paranoid
end

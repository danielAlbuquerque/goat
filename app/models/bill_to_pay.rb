class BillToPay < ActiveRecord::Base
  
  belongs_to :payment_category
  belongs_to :member
  belongs_to :ledger_account

  #Validations
  validates_presence_of :payment_category
  validates_presence_of :ledger_account
  validates_presence_of :member

  #Paranoia
  acts_as_paranoid

  scope :paid, lambda { where("payment_date is not null") }
  scope :pending, lambda { where(payment_date: nil) }

end

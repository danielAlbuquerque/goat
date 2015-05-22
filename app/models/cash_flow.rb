class CashFlow < ActiveRecord::Base
  belongs_to :form_of_payment
  belongs_to :member
  belongs_to :cashier
  belongs_to :ledger_account

  validates_presence_of :cashier
  validates_presence_of :member
  validates_presence_of :ledger_account
  validates_presence_of :form_of_payment

  validates :type, presence: true, length: {is: 1}
  validates :value, presence: true
  validates :description, presence: true, length: {in: 2..30}
  


end

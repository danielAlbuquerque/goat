class CashFlow < ActiveRecord::Base
  belongs_to :form_of_payment
  belongs_to :member
  belongs_to :cashier
  belongs_to :ledger_account

  validates_presence_of :cashier
  validates_presence_of :member
  validates_presence_of :ledger_account

  validates :flow_type, presence: true, length: {is: 1}
  validates :value, presence: true
  validates :description, presence: true

  acts_as_paranoid

  def launch
    Cashier.cash_update(self.cashier_id, self.flow_type, self.value)
    self.save
  end

end

class FormOfPayment < ActiveRecord::Base
  has_many :cash_flows

  validates_presence_of :description

  acts_as_paranoid
end

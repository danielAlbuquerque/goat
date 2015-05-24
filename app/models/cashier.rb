class Cashier < ActiveRecord::Base
  has_many :cash_flows
  acts_as_paranoid
  
end

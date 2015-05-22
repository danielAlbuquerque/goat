class Cashier < ActiveRecord::Base
  has_many :cash_flows
  
end

class BillToPay < ActiveRecord::Base
  belongs_to :payment_categorie
  belongs_to :member
  belongs_to :ledger_account
  
  #Paranoia
  acts_as_paranoid
end

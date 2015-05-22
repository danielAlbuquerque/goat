class BillToReceive < ActiveRecord::Base
  belongs_to :payment_categorie
  belongs_to :member
  belongs_to :ledger_account
end

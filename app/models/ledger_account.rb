class LedgerAccount < ActiveRecord::Base
  validates :description, presence: true, length: {in: 2..50}
  validates :account_type, presence: true, length: {is: 1}

  acts_as_paranoid
end

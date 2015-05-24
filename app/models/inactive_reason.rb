class InactiveReason < ActiveRecord::Base
  belongs_to :member

  validates_presence_of :member
  validates_presence_of :reason
  validates_presence_of :when

  acts_as_paranoid
end

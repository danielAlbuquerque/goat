class InactiveReason < ActiveRecord::Base
  belongs_to :memeber

  validates_presence_of :member
  validates_presence_of :reason
  validates_presence_of :when
end

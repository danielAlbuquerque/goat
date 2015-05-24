class Session < ActiveRecord::Base
  belongs_to :session_type
  has_and_belongs_to_many :members

  validates_presence_of :when
  validates_presence_of :schedule
  validates_presence_of :minutes

  acts_as_paranoid
end

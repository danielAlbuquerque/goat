class Session < ActiveRecord::Base
  belongs_to :session_type
  has_and_belongs_to_many :memebers

  validates_presence_of :when
  validates_presence_of :schedule
  validates_presence_of :minutes
end

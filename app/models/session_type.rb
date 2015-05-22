class SessionType < ActiveRecord::Base
  has_many :sessions

  validates :description, length: {in: 2..30}, presence: true
end

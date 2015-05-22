class Degree < ActiveRecord::Base
  has_many :members

  validates :description, length: {in: 2..30}, presence: true
end

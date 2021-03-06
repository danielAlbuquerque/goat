class PositionHeld < ActiveRecord::Base
  has_many :members
  validates :description, length: {in: 2..40}, presence: true

  acts_as_paranoid
end

class Dependent < ActiveRecord::Base
  belongs_to :memeber

  validates :full_name, presence: true, length: {in: 2..100}
  validates :relationship, presence: true, length: {is: 1}
  validates :rg, presence: true, length: {in: 6..8}
  validates :cpf, presence: true, length: {in: 11..14}
  validates_presence_of :birth_date

  acts_as_paranoid
end

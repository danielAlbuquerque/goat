class Member < ActiveRecord::Base
  # Relationships
  belongs_to :degree
  belongs_to :position_held
  has_many :dependents
  has_many :olds_degree, :class_name => 'Degree', :foreign_key => 'old_degree_id'
  has_many :news_degree, :class_name => 'Degree', :foreign_key => 'new_degree_id'
  has_many :inactive_reason
  has_many :cash_flows
  has_many :bill_to_pays
  has_many :bill_to_receives
  has_and_belongs_to_many :sessions

  # Presence, Unique and length
  validates :cim, length: {in: 2..25}, presence: true, uniqueness: true
  validates :first_name, length: {in: 2..50}, presence: true
  validates :last_name, length: {in: 2..50}, presence: true
  validates :email, length: {in: 2..150}, presence: true, uniqueness: true
  validates :secondary_email, length: {in: 2..150}
  validates :cpf, presence: true, uniqueness: true, length: {is: 14}
  validates :rg, presence: true, uniqueness: true
  validates :workplace_company, length: {in: 2..50}
  validates :profession_company, length: {in: 2..50}
  validates :monthly_payment, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0, less_than: 9999999}
  validates :day_monthly_payment, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0, less_than: 31}
  validates :birth_uf, presence: true, length: {is: 2}
  validates :birth_city, presence: true, length: {in: 2..30}
  validates :address_uf, presence: true, length: {is: 2}
  validates :address_city, presence: true, length: {in: 2..30}
  validates :neighborhood, presence: true, length: {in: 2..50}
  validates :address_number, length: {in: 2..20}
  validates :address, length: {in: 2..200}, presence: true
  validates :complement, length: {in: 2..200}
  validates :zipcode, length: {in: 2..20}

  validates_presence_of :phone1
  validates_presence_of :marital_status
  validates_presence_of :birth_date
  validates_presence_of :birth_uf
  validates_presence_of :degree
  validates_presence_of :initiation_date


  # Email Format validation
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :secondary_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end

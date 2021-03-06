class Member < ActiveRecord::Base

  #Paranoid
  acts_as_paranoid

  #Avatar
  mount_uploader :avatar, AvatarUploader

  #Callbacks
  before_create :set_avatar

  # Relationships
  belongs_to :degree
  belongs_to :position_held
  has_many :dependents
  has_many :olds_degree, :class_name => 'Degree', :foreign_key => 'old_degree_id'
  has_many :news_degree, :class_name => 'Degree', :foreign_key => 'new_degree_id'
  has_many :evolution_grades
  has_many :inactive_reason
  has_many :cash_flows
  has_many :bill_to_pays
  has_many :bill_to_receives
  has_and_belongs_to_many :sessions


  # Presence, Unique and length
  validates :cim, length: {in: 2..25}, presence: true, numericality: true
  validates :first_name, length: {in: 2..50}, presence: true
  validates :last_name, length: {in: 2..50}, presence: true
  validates :email, length: {in: 2..150}, presence: true
  validates :secondary_email, length: {in: 2..150}
  validates :cpf, presence: true, length: {is: 14}
  validates :rg, presence: true, numericality: true
  validates :workplace_company, length: {in: 2..50}
  validates :profession_company, length: {in: 2..50}
  validates :monthly_payment, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0, less_than: 9999999}
  validates :day_monthly_payment, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0, less_than: 31}
  validates :address_uf, presence: true, length: {is: 2}
  validates :address_city, presence: true, length: {in: 2..30}
  validates :neighborhood, presence: true, length: {in: 2..50}
  validates :address_number, length: {in: 2..20}
  validates :address, length: {in: 2..200}, presence: true
  validates :zipcode, length: {in: 2..20}

  validates_presence_of :phone1
  validates_presence_of :marital_status
  validates_presence_of :birth_date
  validates_presence_of :initiation_date
  validates_presence_of :degree

  # Email Format validation
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :secondary_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  #Authlogic
  acts_as_authentic do |c|
    c.session_class = MemberSession
    c.login_field = 'cim'
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  # Scoped Querys
  scope :actives,     lambda { where(active: true).order(:first_name) }
  scope :inactives,   lambda { where(active: false).order(:first_name) }
  scope :all_members, lambda { order(:first_name) }


  #static methods
  def self.current
    Thread.current[:member]
  end

  def self.current=(member)
    Thread.current[:member] = member
  end

  def self.search(search)
    query = "first_name like '%#{search}%' or
            last_name like '%#{search}%' or cim like '%#{search}%'
            or cpf like '%#{search}%'"
    where(query)
  end

  def self.pendent_payments

  end

  #public methods
  def set_avatar
    avatar = "/content/dist/img/user2-160x160.jpg"  unless avatar
  end


end

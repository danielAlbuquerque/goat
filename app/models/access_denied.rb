class AccessDenied < ActiveRecord::Base
  belongs_to :member

  validates_presence_of :member, :created_at
  validates :log, presence: true, length: {in: 2..30}

end

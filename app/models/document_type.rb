class DocumentType < ActiveRecord::Base
	acts_as_paranoid
	validates :description, length: {in: 2..30}, presence: true
end

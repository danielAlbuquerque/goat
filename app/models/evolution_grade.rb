class EvolutionGrade < ActiveRecord::Base
  belongs_to :old_degree, class_name: "Degree"
  belongs_to :new_degree, class_name: "Degree"
  belongs_to :member

  validates_presence_of :degree
  validates_presence_of :member
end

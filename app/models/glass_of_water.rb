class GlassOfWater < ActiveRecord::Base
  belongs_to :session

  acts_as_paranoid
end

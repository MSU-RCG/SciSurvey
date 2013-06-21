class Status < ActiveRecord::Base
  attr_accessible :state, :survey_id
  validates_uniqueness_of :survey_id

end

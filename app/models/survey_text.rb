class SurveyText < ActiveRecord::Base
  has_paper_trail
  attr_accessible :body, :title
end

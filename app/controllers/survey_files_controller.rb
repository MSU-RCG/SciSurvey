class SurveyFilesController < InheritedResources::Base

def create
  create! do |success, failure|
        success.html { redirect_to :back }
  end
end
end

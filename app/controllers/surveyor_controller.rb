# encoding: UTF-8
module SurveyorControllerCustomMethods
  def self.included(base)
    # base.send :before_filter, :require_user   # AuthLogic
    # base.send :before_filter, :login_required  # Restful Authentication
    base.send :layout, :resolve_layout#'application'
  end

  # Actions
  def new
    super
    # @title = "You can take these surveys"
      @title = "Available Protocol Forms"
  end
  def create
    super
  end
  def show
    super
  end
  def edit
    super
  end
  def update
    super
  end

  # Paths
  def surveyor_index
    # most of the above actions redirect to this method
    super # surveyor.available_surveys_path
    #@title = "Available Protocol Forms"
  end
  def surveyor_finish
    # the update action redirects to this method if given params[:finish]
    super # surveyor.available_surveys_path
  end
  
  private

  def resolve_layout
    case action_name
    when "new", "create"
      "application"
    when "show"
      "print_layout"
    else
      "application"
    end
  end
  
end
class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
    
end

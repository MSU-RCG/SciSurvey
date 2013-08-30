class SurveyFile < ActiveRecord::Base
  attr_accessible :attachement, :response_set_id
  mount_uploader :attachement, AttachmentUploader
end

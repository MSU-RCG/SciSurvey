class CreateSurveyFiles < ActiveRecord::Migration
  def change
    create_table :survey_files do |t|
      t.string :attachement
      t.integer :response_set_id

      t.timestamps
    end
  end
end

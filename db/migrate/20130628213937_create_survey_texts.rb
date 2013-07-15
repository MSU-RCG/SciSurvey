class CreateSurveyTexts < ActiveRecord::Migration
  def change
    create_table :survey_texts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

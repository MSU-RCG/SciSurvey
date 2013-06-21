class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :survey_id
      t.string :state

      t.timestamps
    end
  end
end

class AddParentIdToResponseSet < ActiveRecord::Migration
  def change
    add_column :response_sets, :parent_id, :string
  end
end

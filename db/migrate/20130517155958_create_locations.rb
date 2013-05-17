class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :building
      t.string :rm_no
      t.integer :bsi
      t.datetime :inspection_date
      t.string :inspector
      t.integer :ten_liter
      t.integer :microorg
      t.integer :toxin
      t.string :micro_qty
      t.string :toxin_qty
      t.integer :research_loc
      t.integer :exp_loc
      t.integer :store_loc
      t.integer :protocol_id
      t.integer :modification_id

      t.timestamps
    end
  end
end

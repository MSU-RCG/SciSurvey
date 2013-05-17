class Location < ActiveRecord::Base
  attr_accessible :bsi, :building, :exp_loc, :inspection_date, :inspector, :micro_qty, :microorg, :modification_id, :protocol_id, :research_loc, :rm_no, :store_loc, :ten_liter, :toxin, :toxin_qty
end

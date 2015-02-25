class FixColumnNamesInEpgp < ActiveRecord::Migration
  def up
    rename_column :epgps, :ep, :effort_points
    rename_column :epgps, :gp, :gear_points
  end
end

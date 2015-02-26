class RenameColumnServerInGuild < ActiveRecord::Migration
  def up
    rename_column :guilds, :server, :realm
  end
end

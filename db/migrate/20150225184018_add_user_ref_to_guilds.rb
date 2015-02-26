class AddUserRefToGuilds < ActiveRecord::Migration
  def change
    add_reference :guilds, :user, index: true
  end
end

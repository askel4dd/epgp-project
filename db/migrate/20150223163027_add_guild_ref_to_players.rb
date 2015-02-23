class AddGuildRefToPlayers < ActiveRecord::Migration
  def change
    add_reference :players, :guild, index: true
  end
end

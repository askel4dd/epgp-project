class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name
      t.string :region
      t.string :server

      t.timestamps null: false
    end
  end
end

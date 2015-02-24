class CreateEpgps < ActiveRecord::Migration
  def change
    create_table :epgps do |t|
      t.integer :ep
      t.integer :gp
      t.integer :recorded_at
      t.string  :nickname
      t.belongs_to :guild, index: true

      t.timestamps null: false
    end
    add_foreign_key :epgps, :guilds
  end
end

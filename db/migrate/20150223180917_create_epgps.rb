class CreateEpgps < ActiveRecord::Migration
  def change
    create_table :epgps do |t|
      t.integer :ep
      t.integer :gp
      t.integer :recorded_at
      t.belongs_to :player, index: true

      t.timestamps null: false
    end
    #add_reference :epgps, :Player, index: true
    add_foreign_key :epgps, :players
  end
end

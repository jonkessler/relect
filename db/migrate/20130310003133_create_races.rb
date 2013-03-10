class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :position
      t.integer :election_id
      t.timestamps
    end
  end
end

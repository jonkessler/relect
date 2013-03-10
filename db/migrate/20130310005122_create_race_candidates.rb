class CreateRaceCandidates < ActiveRecord::Migration
  def change
    create_table :race_candidates do |t|
      t.integer :race_id
      t.integer :candidate_id

      t.timestamps
    end
  end
end

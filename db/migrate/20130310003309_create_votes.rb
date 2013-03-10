class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :ballot_id
      t.integer :race_id
      t.integer :candidate_id
      t.integer :rank

      t.timestamps
    end
  end
end

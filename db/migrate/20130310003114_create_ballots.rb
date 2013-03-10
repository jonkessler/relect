class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.integer :election_id
      t.timestamps
    end
  end
end

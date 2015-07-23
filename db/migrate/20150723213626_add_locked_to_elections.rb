class AddLockedToElections < ActiveRecord::Migration
  def change
    add_column :elections, :locked, :boolean, null: false, default: false
  end
end

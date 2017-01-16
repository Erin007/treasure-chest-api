class AddHuntidToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :hunt_id, :integer
  end
end

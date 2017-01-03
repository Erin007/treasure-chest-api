class CreateHunts < ActiveRecord::Migration[5.0]
  def change
    create_table :hunts do |t|
      t.string :name
      t.integer :organizer_id
      t.string :passcode

      t.timestamps
    end
  end
end

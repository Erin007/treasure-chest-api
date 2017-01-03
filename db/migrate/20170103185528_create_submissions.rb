class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :directive_id
      t.integer :team_id
      t.string :photo
      t.text :caption
      t.integer :status

      t.timestamps
    end
  end
end

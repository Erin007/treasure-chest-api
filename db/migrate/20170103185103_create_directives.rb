class CreateDirectives < ActiveRecord::Migration[5.0]
  def change
    create_table :directives do |t|
      t.string :name
      t.text :description
      t.boolean :complete?
      t.integer :point_value
      t.integer :hunt_id

      t.timestamps
    end
  end
end

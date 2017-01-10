class AddFirebaseToOrganizers < ActiveRecord::Migration[5.0]
  def change
    add_column :organizers, :firebase, :string
  end
end

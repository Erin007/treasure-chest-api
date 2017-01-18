class AddFirebaseToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firebase, :string
  end
end

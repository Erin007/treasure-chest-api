class AddDirectiveNameToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :directive_name, :string
  end
end

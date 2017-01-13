class RemoveCompleteFromDirectives < ActiveRecord::Migration[5.0]
  def change
    remove_column :directives, :complete?, :boolean
  end
end

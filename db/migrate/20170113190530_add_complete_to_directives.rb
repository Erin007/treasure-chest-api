class AddCompleteToDirectives < ActiveRecord::Migration[5.0]
  def change
    add_column :directives, :complete, :boolean
  end
end

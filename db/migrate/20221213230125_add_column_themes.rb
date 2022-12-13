class AddColumnThemes < ActiveRecord::Migration[7.0]
  def change
    add_column :themes, :description, :text
  end
end

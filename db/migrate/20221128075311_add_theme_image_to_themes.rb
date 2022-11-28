class AddThemeImageToThemes < ActiveRecord::Migration[7.0]
  def change
    add_column :themes, :theme_image, :string
  end
end

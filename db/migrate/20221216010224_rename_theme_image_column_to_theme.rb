class RenameThemeImageColumnToTheme < ActiveRecord::Migration[7.0]
  def change
    rename_column :themes, :theme_image, :image
  end
end

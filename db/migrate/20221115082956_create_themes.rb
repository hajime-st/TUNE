class CreateThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :themes do |t|
      t.string :title, null: false
      t.string :genre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

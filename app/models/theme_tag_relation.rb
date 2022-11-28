class ThemeTagRelation < ApplicationRecord
  belongs_to :theme
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :theme_id }
end

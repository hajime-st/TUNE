class Theme < ApplicationRecord
  mount_uploader :theme_image, ThemeImageUploader
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :theme_tag_relations, dependent: :destroy
  has_many :tags, through: :theme_tag_relations, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 255 }

  def save_with_tags(tag_names:)
    ActiveRecord::Base.transaction do
      self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      save
    end
  end
end

class Tag < ApplicationRecord
  has_many :theme_tag_relations, dependent: :destroy
  has_many :themes, through: :theme_tag_relations, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end

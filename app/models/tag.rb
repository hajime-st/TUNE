class Tag < ApplicationRecord
  has_many :theme_tag_relations, dependent: :destroy
  has_many :themes, through: :theme_tag_relations, dependent: :destroy
  
  # validates :name, inclusion: { in: [/#.+/], allow_blank: true}, uniqueness: true
  # validates_format_of :name, with: /\A#/
  validates :name, uniqueness: true, presence: true
end

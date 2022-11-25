class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :likes, dependent: :destroy

  validates :answer, presence: true
  validates :answer, uniqueness: { scope: :theme_id }
  validates :theme_id, uniqueness: { scope: :user_id }
end
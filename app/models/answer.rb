class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  validates :answer, presence: true
  validates :answer, uniqueness: { scope: :theme_id }
  validates :theme_id, uniqueness: { scope: :user_id }
end
class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  validates :answer, presence: true
end

class Theme < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 255 }
end

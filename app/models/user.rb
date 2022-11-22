class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :themes, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  #ユーザーのオブジェクトかどうかを判定する
  def own?(object)
    id == object.user_id
  end

  # フォローしたときの処理
  def follow(other_user)
    following << other_user
  end

  # フォローを外すときの処理
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # フォローしているか判定
  def following?(other_user)
    following.include?(other_user)
  end
end
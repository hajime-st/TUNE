class RelationshipsController < ApplicationController
  # フォローするとき
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
  end
  # フォロー外すとき
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
  end
end

class RelationshipsController < ApplicationController
  # フォローするとき
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user_path(username: user.username)
  end
  # フォロー外すとき
  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user_path(username: user.username)
  end
end

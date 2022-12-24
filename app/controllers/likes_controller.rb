class LikesController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    current_user.like(@answer)
  end
  
  def destroy
    @answer = current_user.likes.find(params[:id]).answer
    current_user.unlike(@answer)
  end
end

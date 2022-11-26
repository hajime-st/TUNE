class LikesController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    current_user.like(@answer)
    render turbo_stream: turbo_stream.replace('like', partial: 'themes/unlike', locals: { answer: @answer } )
  end
  
  def destroy
    @answer = current_user.likes.find(params[:id]).answer
    current_user.unlike(@answer)
    render turbo_stream: turbo_stream.replace('unlike', partial: 'themes/like', locals: { answer: @answer } )
  end
end

class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to theme_path(comment.theme)
    else
      redirect_to theme_path(comment.theme)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to theme_path(@comment.theme)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(theme_id: params[:theme_id])
  end
end

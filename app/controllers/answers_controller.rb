class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      redirect_to theme_path(@answer.theme)
    else
      redirect_to theme_path(@answer.theme)
    end
  end

  def update
    @answer = current_user.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to theme_path(@answer.theme)
    end
  end

  def destroy
    @answer =  current_user.answers.find(params[:id])
    @answer.destroy!
  end

  private

  def answer_params
    params.permit(:answer).merge(theme_id: params[:theme_id])
  end
end
class AnswersController < ApplicationController
  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      redirect_to theme_path(answer.theme)
    else
      redirect_to theme_path(answer.theme)
    end
  end

  private

  def answer_params
    params.permit(:answer).merge(theme_id: params[:theme_id])
  end
end
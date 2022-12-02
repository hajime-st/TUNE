class AnswersController < ApplicationController
  def new
    if params[:search]
      @search_params = params[:search]
      @songs = RSpotify::Track.search(params[:search]).first(5)
      @theme = params[:theme_id]
      if current_user
        @my_answer = Answer.where(theme_id: @theme).where(user_id: current_user.id).first
      end
    end
  end

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
    redirect_to theme_path(@answer.theme)
  end

  private

  def answer_params
    params.permit(:answer).merge(theme_id: params[:theme_id])
  end
end
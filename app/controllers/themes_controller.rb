class ThemesController < ApplicationController
  def index
    @themes = Theme.all.includes(:user).order(created_at: :desc)
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = current_user.themes.build(theme_params)
    if @theme.save_with_tags(tag_names: params.dig(:theme, :tag_names).gsub(' ', '').split('#').uniq.reject(&:blank?))
      redirect_to themes_path
    else
      render :new
    end
  end

  def show
    @theme = Theme.find(params[:id])
    if params[:search]
      @search_params = params[:search]
      @songs = RSpotify::Track.search(params[:search]).first(10)
    end
    # @answer = Answer.new
    @answers = @theme.answers.includes(:user).order(created_at: :desc)
    @my_answer = Answer.where(theme_id: @theme).where(user_id: current_user.id).first
    @comment = Comment.new
    @comments = @theme.comments.includes(:user).order(created_at: :desc)
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :genre, :theme_image, :theme_image_cache)
  end
end

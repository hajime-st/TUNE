class ThemesController < ApplicationController
  before_action :find_theme, only: [:edit, :update, :destroy]

  def index
    @themes = Theme.all.includes(:user).order(created_at: :desc)
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = current_user.themes.build(theme_params)
    if params[:theme][:tag_names].nil? && @theme.save && @theme.valid?
      redirect_to themes_path
    elsif !params[:theme][:tag_names].nil? && @theme.save_with_tags(tag_names: params.dig(:theme, :tag_names).gsub(' ', '').split('#').uniq.reject(&:blank?))
      redirect_to themes_path
    else
      @theme.tags.first.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @theme_genre = @theme.genre.split(",")
    @answers = @theme.answers.includes(:user).order(created_at: :desc)
    if current_user
      @my_answer = Answer.where(theme_id: @theme).where(user_id: current_user.id).first
    end
    @comment = Comment.new
    @comments = @theme.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @theme.update(theme_params)
      redirect_to themes_path
    else
      render :edit
    end
  end

  def destroy
    @theme.remove_theme_image!
    @theme.save
    @theme.destroy!
    redirect_to themes_path
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :description, :genre, :theme_image, :theme_image_cache)
  end

  def find_theme
    @theme = current_user.themes.find(params[:id])
  end
end

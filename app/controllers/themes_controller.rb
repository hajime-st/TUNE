class ThemesController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID_heroku'], ENV['SPOTIFY_SECRET_ID_heroku'])

  def index
    @themes = Theme.all.includes(:user).order(created_at: :desc)
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = current_user.themes.build(theme_params)
    if @theme.save
      redirect_to themes_path
    else
      render :new
    end
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def search
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :genre)
  end
end

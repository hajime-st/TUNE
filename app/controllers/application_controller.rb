class ApplicationController < ActionController::Base
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID_heroku'], ENV['SPOTIFY_SECRET_ID_heroku'])
  protect_from_forgery

  def not_authenticated
    redirect_to login_path, notice: 'ログインしてください'
  end
end

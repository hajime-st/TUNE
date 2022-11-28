class ApplicationController < ActionController::Base
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID_fly'], ENV['SPOTIFY_SECRET_ID_fly'])
end

class HomeController < ApplicationController
  def top
    @themes = Theme.all.includes(:user).order(created_at: :desc)
  end
end

class HomeController < ApplicationController
  def top
    @themes = Theme.all.includes(:user).order(created_at: :desc)
    @recent_themes = Theme.all.includes(:user).order(created_at: :desc).first(8)
  end

  def terms; end
  def privacy; end
end

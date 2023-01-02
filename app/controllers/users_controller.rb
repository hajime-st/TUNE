class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    @answers = @user.answers.includes(:theme).includes(:likes).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to login_path, notice: "You successfully registered"
      auto_login(@user)
      redirect_back_or_to root_path
    else
      @user.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def following
    @title = "Following"
    @user  = User.find_by(username: params[:username])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find_by(username: params[:username])
    @users = @user.followers
    render 'show_follow'
  end
  
  def themes
    @user = User.find_by(username: params[:username])
    @user_themes = @user.themes.order(created_at: :desc).page(params[:page])
  end

  def likes
    @user = User.find_by(username: params[:username])
    @user_likes = @user.likes.order(created_at: :desc).page(params[:page])
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username)
  end

  # def set_user
  #   @user = User.find(current_user.id)
  # end

  # ログイン済みユーザーかどうか確認
  # def logged_in_user
  #   unless logged_in?
  #     redirect_to login_url
  #   end
  # end

  # 正しいユーザーかどうか確認
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless @user == current_user
  # end

  # def user_params
  #   params.require(:user).permit(:email, :name)
  # end
end
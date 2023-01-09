class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが違います。"
      render :new, status: :unprocessable_entity
    end
  end

  def guest_login
    @guest_user = User.create(
    name: SecureRandom.alphanumeric(10),
    username: SecureRandom.alphanumeric(10),
    email: SecureRandom.alphanumeric(10) + "@email.com",
    password: 'password',
    password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end

  def destroy
    logout
    redirect_to root_path
  end
end
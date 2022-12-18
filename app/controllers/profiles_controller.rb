class ProfilesController < ApplicationController
  before_action :set_user,only: %i[edit update]

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to user_path(username: @user.username)
      else
        @user.valid?
        render :edit, status: :unprocessable_entity
      end
    end

    private
    def set_user
        @user = User.find(current_user.id)
    end

    def user_params
        params.require(:user).permit(:email, :name, :avatar, :avatar_cache )
    end
end

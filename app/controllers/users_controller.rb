class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to ChatApp, You have successfully signed up"
      @user.online = true
      @user.save!
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "There was something wrong with your signup informations"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
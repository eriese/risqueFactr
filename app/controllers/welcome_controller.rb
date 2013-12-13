class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      redirect_to users_path(User.find(session[:user_id]))
    else
      redirect_to "/login"
    end
  end
  def create
    @user = User.where(email: params[:email]).first.try(:authenticate, params[:password])
    session[:user_id] = @user.id
    redirect_to "/users"
  end
  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end

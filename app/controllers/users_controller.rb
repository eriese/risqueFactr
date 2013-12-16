class UsersController < ApplicationController
  def index
    if session[:user_id]
      redirect_to "/users/#{session[:user_id]}"
    else
      redirect_to new_welcome_path
    end
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end
  def show
    @user = User.find(session[:user_id])
    @partners = @user.partners
    @encounters = @partners.map do |partner|
      partner.encounters
    end
    @encounters.flatten!
    @encounters = @encounters.sort_by { |encounter| encounter.took_place }
    @encounters.reverse!
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path(@user)
    else
      redirect_to edit_users_path
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  def encounter
    @user = User.find(params[:id])
    @partners = @user.partners
    @encounters = @partners.map do |partner|
      partner.encounters
    end
    @encounters.flatten!
  end
end

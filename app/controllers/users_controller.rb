class UsersController < ApplicationController
  def index
    if session[:user_id]
      redirect_to "/users/#{session[:user_id]}"
    else
      redirect_to "/login"
    end
  end
  def new
    @user = User.new
    @pref = @user.build_pref
    @pronouns = Pronoun.all
    @email = params[:email]
    @password = params[:password]
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
    @encounters = @user.encounters.order("took_place DESC")
    @diseases = Disease.all.map do |disease|
      [disease.name, disease.risk_window(session[:user_id])]
    end
  end
  def edit
    @user = User.find(params[:id])
    if @user.pref_id
      @pref = @user.pref
      @pronoun = @user.pronoun
    else
      @pref = @user.build_pref
      @pronoun = Pronoun.first
    end
    @pronouns = Pronoun.all
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  def encounter
    @user = User.find(params[:id])
    @partners = @user.partners
    @encounters = @user.encounters.order("took_place DESC")
  end
  def new_encounter
    partner_id = params[:partner_id]
    redirect_to "/partners/#{partner_id}/encounters/new"
  end
end

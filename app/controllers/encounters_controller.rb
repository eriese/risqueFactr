class PronounsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @encounters = @user.encounters
  end
  def new
    @encounter = Encounter.new
  end
  def create
    @user = User.find(session[:user_id])
    @encounter = user.encounters.new(params[:encounter])
    if @encounter.save
      redirect_to encounters_path(@encounter)
    else
      redirect_to new_encounters_path
    end
  end
  def show
    @encounter = Encounter.find(params[:id])
  end
  def edit
    @encounter = Encounter.find(params[:id])
  end
  def update
    @encounter = Encounter.find(params[:id])
    if @encounter.update_attributes(params[:encounter])
      redirect_to encounters_path(@encounter)
    else
      redirect_to edit_encounters_path
    end
  end
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
  end
end

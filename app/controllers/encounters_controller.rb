class EncountersController < ApplicationController
  def index
    @partner = Partner.find(params[:partner_id])
    @encounters = @partner.encounters
  end
  def new
    @partner = Partner.find(params[:partner_id])
    @encounter = @partner.encounters.new()
  end
  def create
    @user = User.find(session[:user_id])
    @partner = Partner.find(params[:partner_id])
    @encounter = @partner.encounters.new(params[:encounter])
    if @encounter.save
      redirect_to partner_encounter_path(@partner, @encounter)
    else
      redirect_to new_partner_encounter_path
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
      redirect_to encounter_path(@encounter)
    else
      redirect_to edit_encounter_path
    end
  end
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
  end
end

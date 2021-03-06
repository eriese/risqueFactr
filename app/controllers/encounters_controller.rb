class EncountersController < ApplicationController
  def index
    @partner = Partner.find(params[:partner_id])
    @encounters = @partner.encounters
  end
  def new
    @partner = Partner.find(params[:partner_id])
    @encounter = @partner.encounters.new
    @contact = @encounter.contacts.new
    @instruments = Instrument.all
    @user = User.find(session[:user_id])
  end
  def create
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
    contacts_objects = @encounter.contacts
    @contacts = @encounter.contacts_parts
    @partner = @encounter.partner
    @user = @encounter.partner.user
  end
  def edit
    @encounter = Encounter.find(params[:id])
    @partner = @encounter.partner
    @contacts = @encounter.contacts.new
    @instruments = Instrument.all
    @user = User.find(session[:user_id])
  end
  def update

    @partner = Partner.find(params[:partner_id])
    @encounter = Encounter.find(params[:id])
    @encounter.contacts.destroy_all
    if @encounter.update_attributes(params[:encounter])
      params[:encounter][:contacts_attributes].each do |key, value|
        if value[:partner_instrument] == "0"
          Contact.find(value[:id]).destroy
        end
      end
      redirect_to partner_encounter_path(@partner, @encounter)
    else
      redirect_to edit_partner_encounter_path(@partner, @encounter)
    end
  end
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
  end
end

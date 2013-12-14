class EncountersController < ApplicationController
  def index
    @partner = Partner.find(params[:partner_id])
    @encounters = @partner.encounters
  end
  def new
    @partner = Partner.find(params[:partner_id])
    @encounter = @partner.encounters.new
    @instruments = Instrument.all
    @genital_contact = @encounter.contacts.new
    @genitals_id = Instrument.where(part: "genitals").first.id

  end
  def create
    @partner = Partner.find(params[:partner_id])
    @encounter = @partner.encounters.new(params[:encounter])
    binding.pry
    if @encounter.save
      redirect_to partner_encounter_path(@partner, @encounter)
    else
      redirect_to new_partner_encounter_path
    end
  end
  def show
    @encounter = Encounter.find(params[:id])
    contacts_objects = @encounter.contacts
    @contacts = contacts_objects.map do |contact|
      contact_array = []
      contact_array << Instrument.find(contact.user_instrument).part
      contact_array << Instrument.find(contact.partner_instrument).part
      contact_array
    end
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

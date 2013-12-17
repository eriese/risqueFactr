class PartnersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @partners = @user.partners
  end
  def new
    @partner = Partner.new
    @pref = @partner.build_pref
    @pronouns = Pronoun.all
    # @exclusivity_options = Partner.exclusivity_options
  end
  def create
    @partner = Partner.new(params[:partner])
    @partner.user_id = session[:user_id]
    if @partner.save
      redirect_to partner_path(@partner)
    else
      redirect_to new_partner_path
    end
  end
  def show
    @partner = Partner.find(params[:id])
    @encounters = @partner.encounters_by_date
  end
  def edit
    @partner = Partner.find(params[:id])
    @pronouns = Pronoun.all
    if @partner.pref_id
      @pref = @partner.pref
      @pronoun = @partner.pronoun
    else
      @pref = @partner.build_pref
      @pronoun = Pronoun.first
    end
  end
  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      redirect_to partner_path(@partner)
    else
      redirect_to edit_partner_path
    end
  end
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
  end
end

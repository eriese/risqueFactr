class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end
  def new
    @partner = Partner.new
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
  end
  def edit
    @partner = Partner.find(params[:id])
  end
  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      redirect_to partners_path(@partner)
    else
      redirect_to edit_partners_path
    end
  end
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
  end
end

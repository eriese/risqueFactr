class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  def new
    @contact = Contact.new
  end
  def create
    contacts = params[:contacts]
    contacts.each do |contact|
      Contact.create(contact)
    end
    redirect_to "/partners/1/encounters/1"
  end
  def show
    @contact = Contact.find(params[:id])
  end
  def edit
    @contact = Contact.find(params[:id])
  end
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to contacts_path(@contact)
    else
      redirect_to edit_contacts_path
    end
  end
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
  end
end

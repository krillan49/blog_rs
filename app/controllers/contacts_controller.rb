class ContactsController < ApplicationController
  def new 
  end
  def create
    @contact = Contact.new(contact_params)
    render action: 'new' if !@contact.save
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end

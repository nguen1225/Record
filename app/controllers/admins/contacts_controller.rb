class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(10)
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    user = contact.user
    ContactMailer.send_admin_reply(user, contact).deliver_now
    redirect_to admins_users_path
  end

  def destroy_all
    @contacts = Contact.all
    @contacts.destroy_all
    redirect_to admins_contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message, :reply)
  end
end

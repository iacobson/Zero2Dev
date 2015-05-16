class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      redirect_to root_path, notice:'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message. Please try again'
      render :new
    end
  end
end

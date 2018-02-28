class HomeController < ApplicationController

  def index
  end

  def send_email
    message = params[:new_email][:message]
    sender =  params[:new_email][:senders_email]
    if !message.blank? && !sender.blank?
      response = CustomMailForm.new.send_mail(sender, message)
      if response == '202'
        flash[:notice] = "Email successfully sent -- I'll be in touch shortly"
      else
        flash[:error]  = "Something went wrong -- please email me at stuartillson@gmail.com"
      end
    else
      flash[:error]  = "Please fill out a valid email address and message"
    end
    redirect_to root_path
  end
end
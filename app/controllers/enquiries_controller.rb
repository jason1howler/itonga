class EnquiriesController < ApplicationController
  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      redirect_to root_path
      flash[:message] = "🎉 Thanks #{@enquiry.name}, we'll keep in touch."
    else
      redirect_to contact_us_path
      flash[:message] = "😔 Sorry, you're message was not recieved please try again."
    end
  end

  private
  
  def enquiry_params
    params.require(:enquiry).permit(:name, :company, :phone_number, :message, :email)
  end
end

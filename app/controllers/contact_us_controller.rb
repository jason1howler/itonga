class ContactUsController < ApplicationController
  def index
    @enquiry = Enquiry.new
  end
end

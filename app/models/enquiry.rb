class Enquiry < ApplicationRecord
  validates :name, :email, :company, :message, presence: true
  validates :phone_number, presence: true, format: { with: /\A0(6\d|7[0-9]|8[1-4]|81[0-7])\d{7}\z/ }
end

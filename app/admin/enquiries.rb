ActiveAdmin.register Enquiry do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :message, :email, :company, :phone_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :message, :email, :company, :phone_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :all, except: [:new, :create, :edit, :update, :destroy]

end

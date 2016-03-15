class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  def account_update_params
    params.require(:user).permit(:location, :phone, :from,
    							 :skype, :time_zone, :type)
  end
end
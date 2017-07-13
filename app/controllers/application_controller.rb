class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :initialize_shopping_cart

  before_action :set_cart

  # include SessionsHelper
  include CurrentCart

  private

  # def initialize_shopping_cart
  #   if session[:shopping_cart_id].nil?
  #     session[:shopping_cart_id] = Cart.create.id
  #   end
  # end


  # confirms a logged in user
  # def logged_in_user
  #   unless logged_in?
  #     store_location
  #     flash[:danger] = 'Please log in.'
  #     redirect_to login_url
  #   end
  # end

  def user_admin?
    current_user.account_type == 'Admin'
  end

  def user_business?
    current_user.account_type == "Business"
  end

  def user_customer?
    current_user.account_type == "Customer"
  end




protected

def configure_permitted_parameters
  # Permit the `subscribe_newsletter` parameter along with the other
  # sign up parameters. (:sign_up)
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :street_address, :suite, :city, :state, :zip_code, :business_name, :food_category, :notes, :super_admin_role, :admin_role, :business_role, :customer_role])
  # account update parameters. (:account_update)
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :street_address, :suite, :city, :state, :zip_code, :business_name, :food_category, :notes, :super_admin_role, :admin_role, :business_role, :customer_role])
end

end

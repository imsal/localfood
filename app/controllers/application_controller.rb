class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  # confirms a logged in user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def user_admin?
    current_user.account_type == 'Admin'
  end

  def user_business?
    current_user.account_type == "Business"
  end

  def user_customer?
    current_user.account_type == "Customer"
  end

end

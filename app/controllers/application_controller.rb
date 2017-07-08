class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :initialize_shopping_cart

  before_action :set_cart

  include SessionsHelper
  include CurrentCart

  private

  # def initialize_shopping_cart
  #   if session[:shopping_cart_id].nil?
  #     session[:shopping_cart_id] = Cart.create.id
  #   end
  # end


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

class UsersController < ApplicationController

  def show
    @user = current_user
    @user_role_type = display_user_role_type
  end

  def create
    # Checks for which role the user will be

    case params[:role]
    when 'super_admin'
      params[:user][:super_admin] = true
      params[:user][:admin] = false
      params[:user][:business] = false
      params[:user][:customer] = false
    when 'admin'
      params[:user][:admin] = true
      params[:user][:super_admin] = false
      params[:user][:business] = false
      params[:user][:customer] = false
    when 'business'
      params[:user][:business] = true
      params[:user][:admin] = false
      params[:user][:super_admin] = false
      params[:user][:customer] = false
    when 'customer'
      params[:user][:customer] = true
      params[:user][:admin] = false
      params[:user][:super_admin] = false
      params[:user][:business] = false
    end
    User.new(params[:user])
  end

  private

  def display_user_role_type
    if @user.super_admin_role?
      'Super Admin'
    elsif @user.admin_role?
      'Admin'
    elsif @user.business_role?
      'Business'
    elsif @user.customer_role?
      'Customer'
    end
  end

end

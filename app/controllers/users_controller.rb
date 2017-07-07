class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_and_current_user_access, only: [:show, :edit, :update, :destroy]
  before_action :admin_only_access, only: [:index]
  # after_action :check_user_account_type, only: [:create]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @admin_users = User.where(account_type: 'Admin')
    @customer_users = User.where(account_type: 'Customer')
    @business_users = User.where(account_type: 'Business')
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :business_name, :email, :password, :password_confirmation, :street_address, :apartment, :city, :state, :zipcode, :account_type, :food_category, :phone_number)
    end

    def check_user_account_type
      # if User.account_type == business create ledger from user
    end

    # only the current user and admin can access these actions
    def admin_and_current_user_access
      set_user
      unless current_user?(@user) || user_admin?
        redirect_to root_url
        # enter flash notice here "You do not have permission to access this page"
      end
    end

    #
    def admin_only_access
      unless user_admin?
        redirect_to root_url
        # you do not have permission to access this page
      end
    end
end

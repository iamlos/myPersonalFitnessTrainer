class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
        # puts request.env["omniauth.auth"].inspect
  end

  def new
    @user = User.new
  end

  def generate_user_info
    @user = User.find(1)
    # fitbit_weight(@user)
    render :json => @user
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User was successfully created." }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, alert: "Signup was not successful." }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :goal)
    end
end

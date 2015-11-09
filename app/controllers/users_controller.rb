class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @exercise = Exercise.find_by(user_id: current_user)
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
      else
        format.html { render :new, alert: "Signup was not successful." }
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
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :goal
      )
    end

end

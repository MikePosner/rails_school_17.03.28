class AdminsController < ApplicationController
  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.password_digest = '1234'
    if @user.save
      redirect_to :admins_show
    else
      render new_admin_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.new session[:user]
    @users=User.all
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_path
  end

  private
    def user_params
      params.require(:user).permit(:teacher_name,:class_name,:category,:password)
    end
end

class SessionsController < ApplicationController

  def login
    @user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
    if @user
      session[:user] = @user
      if @user.category == 1
        redirect_to :admins_show
      elsif @user.category == 2
        redirect_to :general_teachers_show
      elsif @user.category == 3
        redirect_to :general_students_show
      else
        render "ne23w"
      end
    else
      flash.now[:login_error] = "invalid username or password"
      render "new"
    end
  end

  private

  def user_params
    params.require(:session).permit(:name, :password)
  end

end
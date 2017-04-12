class GeneralStudentsController < ApplicationController

  def new
    @user=User.new
  end

  def show
    @user = User.find session[:user]['id']
    @teacher=User.where category:2
    @teacher_name=""
    # @teacher.each{|t| @teacher_name << t.teacher_name}
    @teacher.size>=1?@teacher_name=@teacher.map(&:name).join('、'):@teacher_name=@teacher.name
  end

  def edit
    @user = User.find(session[:user]['id'])
  end

  def update
    @user = User.find(session[:user]['id'])
    @room = Room.where(name:@user.rooms.first.name)
    @room.update(room_params[:rooms])
    if @user.update(user_params)
      session[:user] = @user
      redirect_to :general_students_show
    else
      render 'edit'
    end
  end

  private
  def user_params

    params.require(:user).permit(:name,:category,:password)
    # params.permit(user:[:name,{rooms: :room_name},:category,:password])
  end

  def room_params
    # params.permit(user:[rooms: :room_name])
    params.require(:user).permit(rooms: :name)
  end

end

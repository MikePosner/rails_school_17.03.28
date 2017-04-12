class AdminsController < ApplicationController

def index
  @q = User.ransack(params[:q])
  @users = @q.result(distinct: true)
  @projects = User.search(params[:search])
end

def new
 @user = User.new
end

def create
  @user = User.new(user_params)
  @room=Room.new(room_params[:rooms])
  if @user.save&&@room.save
    @user.rooms << @room
    redirect_to :admins_show
  else
    render new_admin_path
  end
end

def edit
  @user = User.find(params[:id])
  # @rooms = Room.all
end

def show
  @user = User.new session[:user]
  @users = User.all
  @rooms = Room.all
end

def update
  @user = User.find(params[:id])
  @user.room_ids = [params['room']['room_id']]
  if @user.save
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

def show_teachers
  @user = User.new session[:user]
  if params['room']
    @room = Room.find(params['room']['id'])
    @users = @room.users
  else
    @users = User.all
  end
  @q = @users.ransack(params[:q])
  @teachers = @q.result.where "category=2"
end

def show_students
  @user = User.new session[:user]
  if params['room']
    @room = Room.find(params['room']['id'])
    @users = @room.users
  else
    @users = User.all
  end
  @q = @users.ransack(params[:q])
  @students = @q.result.where "category=3"
end

def show_classes
  @user = User.new session[:user]
  @rooms=Room.all
  @q = @rooms.ransack(params[:q])
  @rooms = @q.result
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

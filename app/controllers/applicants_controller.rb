class ApplicantsController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    @room=Room.new(room_params[:rooms])
  	if @user.save&&@room.save
      @user.rooms << @room
  		redirect_to :sessions_new
  	else
  		render "new"
  	end
  end

  private 

    def user_params
      params.require(:user).permit(:name,:category,:password,:password_confirmation)
    end

    def room_params
     params.require(:user).permit(rooms: :name)
    end
  
end

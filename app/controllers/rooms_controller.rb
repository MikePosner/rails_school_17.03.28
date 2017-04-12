class RoomsController < ApplicationController

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to admin_path
  end


  private
    def room_params
      params.require(:room).permit(:name)
    end

end

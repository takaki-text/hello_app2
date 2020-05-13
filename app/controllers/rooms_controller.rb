class RoomsController < ApplicationController
    before_action :authenticate_user!
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def index
    @currentUserEntry = Entry.where(user_id: current_user.id)
    room_ids = @currentUserEntry.pluck(:room_id)
    @opponentEntry = Entry.where.not(user_id: current_user.id).where(room_id: room_ids)
    @currentUserEntry.each do |cu|
      @opponentEntry.each do |e|
        if cu.room_id == e.room_id then
          @isRoom = true
        end
      end
    end
  end

end






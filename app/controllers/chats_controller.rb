class ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @room = call_private_room
    @chats = @room.chats
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save!
  end

  private
  def call_private_room
    smaller_id, bigger_id = [ current_user.id, params[:id].to_i ].sort()
    Room.where( 'user1_id', smaller_id )&.find_by( user2_id: bigger_id ) ||
    Room.new( user1_id: smaller_id, user2_id: bigger_id ).save && Room.where( 'user1_id', smaller_id ).find_by( user2_id: bigger_id )
  end

  def chat_params
    params.permit(:user_id, :room_id, :comment)
  end
end

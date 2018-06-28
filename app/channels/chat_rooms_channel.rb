class ChatRoomsChannel < ApplicationCable::Channel
	def subscribed
		stream_from "chat_rooms#{params['chat_room_id']}"
	end

	def unsubscribed
	end

	def send_message(data)
	  current_user.messages.crate!(body: data['message'], chat_rooms_id: data['chat_room_id'])
	end
end

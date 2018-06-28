jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
  

App.global_chat = App.cable.subscriptions.create {
  channel: "ChatRoomsChannel"
  chat_room_id: messages.data('chat-room-id')
},

  $('#new_message').submit (e) ->
   $this = $(this)
   textarea = $this.find('#message_body')
   if $.trim(textarea.val()).length > 1
     
     App.global_chat.send_message textarea().val(),
messages.data('chat-room-id')
      textarea.val('')
   e.preventDefault()

   return false

  connected: ->
  
  disconnected ->

  received: (data) ->
    messages.append data['message']

  send_message: (message, chat_room_id) ->
    @perform 'send_message', message: message, chat_room_id: chat_room_id  

@addOnlineStatusFor = (user) ->
  $("#online_members").append HandlebarsTemplates['user'](user)

@removeOnlineStatusFor = (user) ->
  $("#online_members").find("#user_#{user.id}").remove()

jQuery ->
  pusher = new Pusher('5e882a17808180c618be')

  general_chat = pusher.subscribe('general-chat')
  general_chat.bind 'create_message', (data) ->
    $("#messages").prepend HandlebarsTemplates['message'](data)
    $("#new_message")[0].reset()

  presence_general_chat = pusher.subscribe('presence-general-chat')

  presence_general_chat.bind 'pusher:subscription_succeeded', (members) ->
    members.each (member) ->
      addOnlineStatusFor member

  presence_general_chat.bind 'pusher:member_added', (member) ->
    addOnlineStatusFor member

  presence_general_chat.bind 'pusher:member_removed', (member) ->
    removeOnlineStatusFor member

pusher = new Pusher('5e882a17808180c618be')
channel = pusher.subscribe('general-chat')
channel.bind 'create_message', (data) ->
  $("#messages").prepend HandlebarsTemplates['message'](data)
  $("#new_message")[0].reset()

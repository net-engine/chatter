module MessagesHelper
  def message_timestamp(message = @message)
    localtime = message.created_at.in_time_zone('Brisbane')
    case message.created_at.yday
    when Date.today.yday
      localtime.strftime "%l:%M%P"
    when Date.today.yday - 1
      localtime.strftime "%l:%M%P yesterday"
    else
      localtime.strftime "%l:%M%P, %e %b"
    end
  end
end

class MessagesController < ApplicationController
  before_filter :authorize

  def index
    @messages = Message.order("created_at DESC")
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = current_user.messages.new params[:message]
    return unless @message.save
    Pusher['general-chat'].trigger('create_message', 
      Rabl.render(@message, 'messages/show', :view_path => 'app/views', :format => :json))
    render nothing: true
  end
end
class MessagesController < ApplicationController
  before_filter :authorize
  
  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.create! params[:message]
  end
end

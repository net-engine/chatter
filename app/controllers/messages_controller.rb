class MessagesController < ApplicationController
  before_filter :authorize
  
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create params[:message]
  end
end

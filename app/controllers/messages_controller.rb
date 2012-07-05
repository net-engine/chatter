class MessagesController < ApplicationController
  before_filter :authorize

  def index
    @messages = Message.order("created_at DESC")
  end

  def create
    @message = current_user.messages.new params[:message]
    return unless @message.save
  end
end
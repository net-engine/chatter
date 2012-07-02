class MessagesController < ApplicationController
  before_filter :authorize
  
  def index
    @messages = Message.all
  end
end

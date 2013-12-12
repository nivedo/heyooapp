

class MessagesController < ApplicationController
  def index
    @title = "Inbox"
    @message = Content.new
  end
end


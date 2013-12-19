

class MessagesController < ApplicationController
  respond_to :js, :html, :json

  def index
    @title = "Inbox"
    @messages = Message.order('created_at DESC')
    mygroups = current_user.memberships.map{|m| m.id}

    @messages = @messages.where(:group_id => mygroups)
    @message = Message.new
    @content = @message.build_content

    @embed_post_link = "New Message"
  end

  def new
    @title = "New Message"
    @message = Message.new
    @content = @message.build_content
  end

  def create
    @message = Message.new
    @recipients = @message.build_group
    @recipients.members << current_user # Always include self in recipient list
    
    recipient_ids = params[:recipients].split(',')
    recipient_ids.each do |rid|
      @recipients.members << User.find(rid)
    end

    @content = @message.build_content
    @content.description = params[:description]
    @content.user = current_user

    if @message.save
      redirect_url = messages_url
      flash[:success] = "Message Sent!" if !request.xhr?
    end

    respond_with(@message, :location => redirect_url)
  end

  def show
    @message = Message.find(params[:id])
    @recipients = exclude_self(@message.group.members)
    @reply = Content.new
    @content = @message.content

    @title = "Conversation with "

    if @recipients.length == 1
       @title = @title + @recipients.first.display_name
    else
      if @recipients.length == 2
        @title = @title + @recipients.first.first_name + " and " + @recipients.last.first_name
      else
        @recipients.each do |r|
          if r.id != @recipients.last.id
            @title = @title + r.first_name + ", "
          else
            @title = @title + "and " + r.first_name
          end
        end
      end
    end
  end
end


class ContentsController < ApplicationController
  before_filter :require_login

  def new
    @content = Content.new(:parent_id => params[:parent_id])
    
  end

  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id

    @content.ancestry = params[:content][:parent_id].empty? ? nil : params[:content][:parent_id]
    if params[:content]['attachment']
        params[:content]['attachment'].each do |attachment|
          @image = Image.create!(:attachment => attachment)
          @content.images << @image
        end
      end
    

    respond_to do |format|
      if @content.save
        format.js
        format.html {
          if params[:content][:parent_id].nil? || params[:content][:parent_id].empty?
            redirect_to contents_url, :flash => { :success => "New content posted!" }
          else
            redirect_to content_url(@content.ancestry), :flash => { :success => "Comment Posted!" }
          end
        }
        format.json { render json: @content }
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @content.errors }
      end
    end
  end

  def index
    @contents = Content.where({ancestry: nil}).order('created_at DESC')
    @uploader = Image.new.attachment
    @uploader.success_action_redirect = root_url
    
    @user = current_user
    @title = "Discussions"
    @embed_post = true;
    @content = Content.new
  end

  def show
    @content = Content.find(params[:id])
    @reply = Content.new
    @title = @content.title
    @subtitle = "From " + @content.user.display_name + ". on " + @content.created_at.strftime("%Y-%m-%d")

    @user = current_user
    @embed_reply = true

    if @content.ancestry
      redirect_to content_url(@content.ancestry)
    end
    
  end

  def edit
    @content = Content.find(params[:id])

    @title = @content.ancestry ? 'Edit Comment' : 'Edit Post'
    
  end

  def update
    content = Content.find(params[:id])
    
    if content.update_attributes(content_params)
      redirect_to content_url(content.id), :flash => { :success => "Post Updated!" }
    else
      render 'edit'
    end
  end

  def content_params
    params.require(:content).permit(
      
      
      :description,
      :title
    )
  end

  def create_reply
    create
  end
  
end

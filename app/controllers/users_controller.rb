class UsersController < ApplicationController
  respond_to :js, :html, :json

  def new
    @user = User.new

    respond_with @user
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signed Up!"
    end

    respond_with @user
  end

  def index
    @users = User.order(:last_name);
    @title = "Directory";

    

    respond_with(@users) do |format|
      format.json {
        @userList = @users.map { |u| { :id => u.id, :name => u.first_name + " " + u.last_name } }
        @userList = @userList.find_all{ |u| u[:name].downcase.include?(params[:q].downcase) } if params[:q]
        render :json => @userList
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name, 
      :last_name, 
      :phone_number, 
      :unit_number, 
      
      
      :password, 
      :password_confirmation
    )
  end
end

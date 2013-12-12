class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, :notice => "Signed up!" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.order(:last_name);
    @title = "Directory";
    respond_to do |format|
      format.html
      format.json {
        userlist = @users.where("first_name like ? OR last_name like ?", "%#{params[:q]}%", "%#{params[:q]}%").map do |u|
          { :id => u.id, :name => u.first_name + " " + u.last_name }
        end
        render :json => userlist
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

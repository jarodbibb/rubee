class UsersController < ApplicationController
  def create
    @user = User.new( makin_user )
    puts "innnnnn user controler create", @user, "--------------------"
    if @user.save 
      session[:user_id] = @user.id
    redirect_to '/songs/show'
    else 
      flash[:notice] = @user.errors.full_messages
      redirect_to "/"
    end
  end
  def new
  end 
  def display 
    @playlist = Playlist.where("users_id" => current_user.id)
  end 


  def destroy
    session.clear
    redirect_to "/"
  end
  private 
  def makin_user
    params.require(:user).permit(:first_name, :last_name, :email, :password ) 
  end 
end

class SessionsController < ApplicationController
  def log
    @user = User.find_by_email(log_in[:email]).try(:authenticate, log_in[:password])
   
    session.clear
    if @user
      session[:user_id] = @user.id
      redirect_to "/songs/show"
    else 
      flash[:errors] = ["ooops"]
      redirect_to "/"
    end
  end
  def verify


  end
  def destroy
  end
  private
  
  def log_in
    params.require(:user).permit(:email, :password)
  end 
end


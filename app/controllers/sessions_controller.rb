class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_user_path
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_back(fallback_location:"/")
    end
  end

  def destroy
    reset_session
    redirect_to new_user_path
  end

end

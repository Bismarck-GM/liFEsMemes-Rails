# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = ['Logged in successfully.']
      redirect_to new_session_path
    else
      flash[:notice] = ['Invalid Combination']
      redirect_back(fallback_location: new_session_path)
    end
  end

  def destroy
    reset_session
    flash[:notice] = ['Logged out successfully.']
    redirect_to new_session_path
  end
end

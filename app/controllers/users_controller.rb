class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  private

  def user_params
    
  end
end

class ProfilesController < ApplicationController
  def index
    # All the users
    @users = User.all
  end

  def show
    # One particular user
    @user = User.find(params[:id])
  end
end

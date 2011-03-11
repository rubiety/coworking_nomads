class UsersController < ApplicationController
  load_and_authorize_resource

  respond_to :html, :json

  def index
    respond_with @users
  end

  def show
    respond_with @user
  end

  def edit
    respond_with @user
  end

  def update
    @user.attributes = params[:user]
    flash[:confirm] = "User profile successfully updated." if @user.save
    respond_with @user
  end

  def destroy
    flash[:confirm] = "User account has successfully been deleted." if @user.destroy
    respond_with @user, :location => root_path
  end
end

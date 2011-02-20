class CheckInsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :city
  load_and_authorize_resource :venue, :through => :city
  load_and_authorize_resource :check_in, :through => :venue

  respond_to :html, :json

  def index
    respond_with @check_ins
  end

  def show
    respond_with @check_in
  end

  def new
    respond_with @check_in
  end

  def create
    @check_in.attributes = params[:check_in]
    @check_in.user = current_user
    flash[:confirm] = "You have successfully checked in." if @check_in.save
    respond_with @check_in, :location => [@city, @venue]
  end

  def destroy
    flash[:confirm] = "You have successfully un checked in." if @check_in.destroy
    respond_with @check_in, :location => [@city, @venue]
  end
end

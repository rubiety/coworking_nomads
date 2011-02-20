class VenuesController < ApplicationController
  load_and_authorize_resource :city
  load_and_authorize_resource :venue, :through => :city

  respond_to :html, :json

  def index
    respond_with @venues
  end

  def show
    respond_with @venue
  end

  def new
    respond_with @venue
  end

  def edit
    respond_with @venue
  end

  def create
    @venue.attributes = params[:venue]
    flash[:notice] = "Venue was successfully created." if @venue.save
    respond_with @venue, :location => [@city, @venue]
  end

  def update
    @venue.attributes = params[:venue]
    flash[:notice] = "Venue was successfully updated." if @venue.save
    respond_with @venue, :location => [@city, @venue]
  end

  def activate
    @venue.activate
    flash[:notice] = "Venue was successfully activated."
    respond_with @venue, :location => [@city, @venue]
  end

  def deactivate
    @venue.deactivate
    flash[:notice] = "Venue was successfully deactivated."
    respond_with @venue, :location => [@city, @venue]
  end

  def destroy
    flash[:notice] = "Venue was successfully deleted." if @venue.destroy
    respond_with @venue, :location => [@city, :venues]
  end
end

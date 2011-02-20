class CitiesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json
  
  def index
    respond_with @cities
  end
  
  def show
    respond_with @city
  end

  def dashboard
    respond_with @city
  end
  
  def new
    respond_with @city
  end

  def edit
    respond_with @city
  end
  
  def create
    @city.attributes = params[:city]
    flash[:notice] = "City was successfully created." if @city.save
    respond_with @city
  end
  
  def update
    @city.attributes = params[:city]
    flash[:notice] = "City was successfully updated." if @city.save
    respond_with @city
  end

  def activate
    @city.activate
    flash[:notice] = "City was successfully activated."
    respond_with @city
  end

  def deactivate
    @city.deactivate
    flash[:notice] = "City was successfully deactivated."
    respond_with @city
  end
  
  def destroy
    flash[:notice] = "City was successfully deleted." if @city.destroy
    respond_with @city
  end
end

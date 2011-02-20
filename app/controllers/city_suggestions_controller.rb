class CitySuggestionsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  def index
    respond_with @city_suggestions
  end

  def new
    respond_with @city_suggestion
  end

  def create
    @city_suggestion.attributes = params[:city_suggestion]
    flash[:notice] = "City suggestion was successfully created." if @city_suggestion.save
    respond_with @city_suggestion, :location => root_path
  end

  def destroy
    flash[:notice] = "City suggestion was successfully created." if @city_suggestion.destroy
    respond_with @city_suggestion
  end
end

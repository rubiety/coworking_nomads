class VenueSuggestionsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :city
  load_and_authorize_resource :venue_suggestion, :through => :city

  respond_to :html, :json

  def index
    respond_with @venue_suggestions
  end

  def new
    respond_with @venue_suggestion
  end

  def create
    @venue_suggestion.attributes = params[:venue_suggestion]
    @venue_suggestion.user = current_user
    flash[:notice] = "Venue suggestion was successfully created." if @venue_suggestion.save
    respond_with @venue_suggestion, :location => @city
  end
end

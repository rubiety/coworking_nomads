class ReviewsController < ApplicationController
  load_and_authorize_resource :city
  load_and_authorize_resource :venue, :through => :city
  load_and_authorize_resource :review, :through => :venue

  respond_to :html, :json

  def index
    respond_with @reviews
  end

  def show
    respond_with @review
  end

  def new
    respond_with @review
  end

  def edit
    respond_with @review
  end

  def create
    @review.attributes = params[:review]
    @review.user = current_user
    flash[:confirm] = "Review has been successfully created." if @review.save
    respond_with @review, :location => [@city, @venue]
  end

  def update
    @review.attributes = params[:review]
    flash[:confirm] = "Review has been successfully updated." if @review.save
    respond_with @review, :location => [@city, @venue]
  end

  def destroy
    flash[:confirm] = "Review has been successfully deleted." if @review.destroy
    respond_with @review, :location => [@city, @venue]
  end
end

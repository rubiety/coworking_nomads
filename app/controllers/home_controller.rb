class HomeController < ApplicationController
  def index
    if Rails.env.production?
      render :action => "landing", :layout => "landing"
      return false
    end
    
    @cities = City.accessible_by(current_ability)
  end
end

class HomeController < ApplicationController
  def index
    @cities = City.accessible_by(current_ability)
  end
end

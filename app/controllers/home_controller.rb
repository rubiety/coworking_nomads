class HomeController < ApplicationController
  def index
    @cities = City.active.accessible_by(current_ability)
  end
end

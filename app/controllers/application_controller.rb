class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  if Rails.env.staging?
    before_filter :authenticate_staging
    
    def authenticate_staging
      authenticate_or_request_with_http_basic do |username, password|
        username == 'oscar' && password == 'peterson'
      end
    end
  end
  
  if Rails.env.production?
    before_filter :force_landing_page
    
    def force_landing_page
      unless request.path == "/"
        redirect_to "/"
        return false
      end
    end
  end
end

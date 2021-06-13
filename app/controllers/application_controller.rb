class ApplicationController < ActionController::Base
  layout :layout_by_resource
  
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    
    redirect_back(fallback_location: root_path)
  end
end

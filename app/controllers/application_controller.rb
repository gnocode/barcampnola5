class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authorized
    flash.now[:error] = "You need to be logged in."
    redirect_to root_url
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = Account.from_omniauth env["omniauth.auth"]
    auto_login user
    redirect_to root_url
  end

  def destroy
    logout
    redirect_to root_url
  end
end

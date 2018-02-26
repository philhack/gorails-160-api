class AuthenticationController < ApiController

  skip_before_action :authenticate_token!
  def create

  end
end
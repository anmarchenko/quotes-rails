class ApplicationController < ActionController::Base
  before_action :set_current_request_details

  before_action :authenticate
  before_action :require_authentication

  private

  def authenticate
    if (session_record = Session.preload(user: :company).find_by(id: cookies.signed[:session_token]))
      Current.session = session_record
    end
  end

  def require_authentication
    redirect_to sign_in_path unless Current.session
  end

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end
end

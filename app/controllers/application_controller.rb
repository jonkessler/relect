class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  
  check_authorization
  
  rescue_from CanCan::AccessDenied do |_|
    redirect_to root_path, :alert => 'You do not have permission to access that page'
  end

  def after_sign_in_path_for(*)
    elections_path
  end
end

module Users
  class SessionsController < Devise::SessionsController
    skip_authorization_check
  end
end
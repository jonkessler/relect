module Users
  class ConfirmationsController < Devise::ConfirmationsController
    skip_authorization_check
  end
end
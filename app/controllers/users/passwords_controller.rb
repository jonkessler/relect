module Users
  class PasswordsController < Devise::PasswordsController
    skip_authorization_check
  end
end
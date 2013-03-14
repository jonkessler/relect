module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_authorization_check
  end
end
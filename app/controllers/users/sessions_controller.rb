module Users
  class SessionsController < Devise::SessionsController
    skip_authorization_check

    def create
      if (token = params[:token])
        begin
        response = RestClient::Resource.new('https://www.googleapis.com/oauth2/v3/tokeninfo').post(id_token: token)
        response
        rescue RestClient::Exception
          super
        end
      else
        super
      end
    end
  end
end

module Apigee
  class API
    module Oauth2

      # Get count of Access Tokens
      def access_token_count
        get("/oauth2/accesstokens")
      end

      # Approve an Access Token
      def approve_access_token(token)
        get("/oauth2/accesstokens/#{token}?action=approve")
      end

      # Revoke an Access Token
      def revoke_access_token(token)
        post("/oauth2/accesstokens/#{token}?action=revoke")
      end

      # Get an Access Token
      def access_token(token)
        get("/oauth2/accesstokens/#{token}")
      end

      # Delete an Access Token
      def delete_access_token(token)
        delete("/oauth2/accesstokens/#{token}")
      end

      # TODO Update Access Token
      # def update_access_token(token)
      #   update("/oauth2/accesstokens/#{token}")
      # end

      # List Authorization Codes
      def auth_codes
        get("/oauth2/authorizationcodes")
      end

      # Get Authorization Code
      def auth_code(token)
        get("/oauth2/authorizationcodes/#{token}")
      end

      # Delete Authorization Code
      def delete_auth_code(token)
        delete("/oauth2/authorizationcodes/#{token}")
      end

    end
  end
end

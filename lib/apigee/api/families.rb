module Apigee
  class API
    module Families

      # Create an app family
      def create_family(email, name, apps)
        post("/developers/#{email}/appfamilies", {:name => name, :apps => apps})
      end

      # Delete an app family
      def delete_family(email, name)
        delete("/developers/#{email}/appfamilies/#{name}")
      end

      # Get an app family
      def family(email, name)
        get("/developers/#{email}/appfamilies/name")
      end

      # List all app families
      def families(email, expand=false)
        get("/developers/#{email}/appfamilies", {:expand => expand})
      end

      # Remove app from family
      def delete_app_from_family(email, family, name)
        delete("/developers/#{email}/appfamilies/#{family}/app/#{name}")
      end

      # Update family
      def update_family(email, name, params)
        post("/developers/#{email}/appfamilies/#{name}", params)
      end

    end
  end
end



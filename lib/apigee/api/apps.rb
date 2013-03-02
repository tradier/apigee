module Apigee
  class API
    module Apps

      # List apps in an org
      def apps
        get('/apps')
      end

      # Get an app profile (by id)
      def app_by_id(id)
        get("/apps/#{id}")
      end
      alias :app :app_by_id

      # Get an app profile (by family)
      def app_by_family(family)
        get("/apps", {:appfamily => family})
      end

      # Get an app profile (by status)
      def app_by_status(status)
        get("/apps", {:status => status})
      end

      # Get an app profile (by type)
      def app_by_type(type)
        get("/apps", {:apptype => type})
      end

    end
  end
end
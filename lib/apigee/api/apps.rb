module Apigee
  class API
    module Apps

      # List apps in an org
      def apps(options={})
        get('/apps', options)
      end

      # Get an app profile (by id)
      def app_by_id(id)
        get("/apps/#{id}")
      end
      alias :app :app_by_id

      # Get an app profile (by family)
      def apps_by_family(family)
        apps(:appfamily => family)
      end

      # Get an app profile (by status)
      def apps_by_status(status)
        apps(:status => status)
      end

      # Get an app profile (by type)
      def apps_by_type(type)
        apps(:apptype => type)
      end

      # Get an app profile (by type)
      def apps_by_creation_date(createdat)
        t = createdat.is_a?(Time) ? createdat.to_i : createdat
        apps(:createdat => t)
      end

    end
  end
end

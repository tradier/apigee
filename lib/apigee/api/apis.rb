module Apigee
  class API
    module Apis

      # Create an API
      def create_api(name)
        post("/apis", {:name => name})
      end

      # Delete an API
      def delete_api(name)
        delete("/apis/#{name}")
      end

      # Delete an API Revision
      def delete_api_revision(name, rev)
        delete("/apis/#{name}/revision/#{rev}")
      end

      # Deploy an API to an Environment
      def deploy_api(name, rev, env, path)
        post("/apis/#{name}/revisions/#{rev}/deployments", {:action => 'deploy', :env => env, :basepath => path})
      end

      # Export an API
      # TODO this probably won't work since it's transferring a file
      def export_api(name, rev)
        get("/apis/#{name}/revisions/#{rev}", {:format => 'bundle'})
      end

      # Get an API
      def api(name)
        get("/apis/#{name}")
      end
      alias :api_by_id :api

      # Import an API
      # TODO this probably won't work since you need to send a file
      def import_api(name)
        post("/apis", {:action => 'import', :name => name})
      end

      # List APIs
      def apis
        get("/apis")
      end

      # Undeploy an API from an Environment
      def undeploy_api(name, rev, env)
        post("/apis/#{name}/deployments", {:action => 'undeploy', :env => env, :revision => rev})
      end

      # Update an API
      def update_api(name, params)
        put("/apis/#{name}", params)
      end

    end
  end
end




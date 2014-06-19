module Apigee
  class API
    module DeveloperApps

      def create_developer_app(options={})
        developer_email = options.delete(:email)
        post("/developers/#{developer_email}/apps", options)
      end

      def update_developer_app(options={})
        developer_email = options.delete(:email)
        app_name     = options[:name]
        put("/developers/#{developer_email}/apps/#{app_name}", options)
      end

      def delete_developer_app(options={})
        developer_email = options.delete(:email)
        app_name     = options.delete(:name)
        delete("/developers/#{developer_email}/apps/#{app_name}")
      end

      def developer_apps(options={})
        developer_email = options.delete(:email)
        get("/developers/#{developer_email}/apps", options)
      end

      def developer_app(options={})
        developer_email = options.delete(:email)
        app_name     = options.delete(:name)
        get("/developers/#{developer_email}/apps/#{app_name}")
      end

    end
  end
end

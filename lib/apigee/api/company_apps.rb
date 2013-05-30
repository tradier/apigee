module Apigee
  class API
    module CompanyApps

      def create_company_app(options={})
        company_name = options.delete(:company_name)
        post("/companies/#{company_name}/apps", options)
      end

      def update_company_app(options={})
        company_name = options.delete(:company_name)
        app_name     = options.delete(:name)
        post("/companies/#{company_name}/apps/#{app_name}", options)
      end

      def delete_company_app(options={})
        company_name = options.delete(:company_name)
        app_name     = options.delete(:name)
        delete("/companies/#{company_name}/apps/#{app_name}")
      end

      def company_apps(options={})
        company_name = options.delete(:company_name)
        get("/companies/#{company_name}/apps", options)
      end

      def company_app(options={})
        company_name = options.delete(:company_name)
        app_name     = options.delete(:name)
        get("/companies/#{company_name}/apps/#{app_name}")
      end

    end
  end
end

module Apigee
  class API
    module Companies

      def companies(options={})
        get('/companies', options)
      end

      def create_company(options={})
        post('/companies', options)
      end

      def update_company(company_name, options={})
        post("/companies/#{company_name}", options)
      end

      def delete_company(company_name)
        delete("/companies/#{company_name}")
      end

      def company(company_name)
        get("/companies/#{company_name}")
      end

      def company_appfamilies(company_name)
        get("/companies/#{company_name}/appfamilies")
      end
      alias :company_app_families :company_appfamilies

    end
  end
end

module Apigee
  class API
    module Developers

      def developers(options={})
        get('/developers', options)
      end

      def create_developer(options={})
        post('/developers', options)
      end

      def update_developer(developer_email, options={})
        put("/developers/#{developer_email}", options)
      end

      def delete_developer(developer_email)
        delete("/developers/#{developer_email}")
      end

      def developer(developer_email)
        get("/developers/#{developer_email}")
      end

      def developer_appfamilies(developer_email)
        get("/developers/#{developer_email}/appfamilies")
      end
      alias :developer_app_families :developer_appfamilies

    end
  end
end

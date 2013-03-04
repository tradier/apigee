module Apigee
  class API
    module Audits

      # Get organization audit logs
      def organization_audit(params)
        get("/audits/organizations/#{organization}", params)
      end

      # Get API audit logs
      def api_audit(api, params)
        get("/audits/apis/#{api}", params)
      end

      # Get API revision audit logs
      def api_revision_audit(api, revision, params)
        get("/audits/apis/#{api}/revisions/#{revision}", params)
      end

      # Get API policy audit logs
      def api_policy_audit(api, revision, policy, params)
        get("/audits/apis/#{api}/revisions/#{revision}/policies/#{policy}", params)
      end

      # Get API resource audit logs
      def api_resource_audit(api, revision, resource, params)
        get("/audits/apis/#{api}/revisions/#{revision}/resources/#{resource}", params)
      end

      # Get user audit logs
      def user_audit(email, params)
        get("/user/#{email}/audits", params)
      end

    end
  end
end
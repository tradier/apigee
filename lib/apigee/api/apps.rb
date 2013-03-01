module Apigee
  class API
    module Apps

      def app(id)
        get("/apps/#{id}")
      end

    end
  end
end
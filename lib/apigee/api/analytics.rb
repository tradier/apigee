module Apigee
  class API
    module Analytics

      # Get an analytics report for a dimension
      def report(env, dimension, query)
        get("/environments/#{env}/stats/#{dimension}", query)
      end

    end
  end
end

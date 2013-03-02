module Apigee
  class API
    module Products

      # Create an API product
      def products(params)
        post("/apiproducts", params)
      end

      # Delete an API product
      def delete_product(name)
        delete("/apiproducts/#{name}")
      end

      # Get an API product
      def product(name)
        get("/apiproducts/#{name}")
      end

      # Get product info
      def product_info(name, query, entity)
        get("/apiproducts/#{name}", {:query => query, :entity => entity})
      end

      # List API products
      def products
        get("/apiproducts")
      end

      # Update API product
      def products(params)
        put("/apiproducts", params)
      end

      # Search API products
      def products(name, value)
        get("/apiproducts", {:attributename => name, :attributevalue => value})
      end

    end
  end
end

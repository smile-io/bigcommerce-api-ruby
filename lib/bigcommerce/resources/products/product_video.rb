# Product Video
# Embedded videos displayed on product listings.
# https://developer.bigcommerce.com/api/stores/v2/products/videos

module Bigcommerce
  class ProductVideo < Resource
    include Bigcommerce::SubresourceActions.new uri: 'v2/products/%d/videos/%s'

    property :id
    property :product_id
    property :count
    property :url
    property :sort_order
    property :name

    def self.count(product_id, params = {})
      get "v2/products/#{product_id}/videos/count", params
    end

    def self.count_all(params = {})
      get 'v2/products/videos/count', params
    end
  end
end

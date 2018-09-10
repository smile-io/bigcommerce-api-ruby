# Order Status
# Statuses that can be assigned to orders. Each status represents a state in
# the fulfilment workflow.
# https://developer.bigcommerce.com/api/stores/v2/order_statuses

module Bigcommerce
  class OrderStatus < Resource
    include Bigcommerce::ResourceActions.new(
      uri: 'v2/order_statuses/%d',
      disable: %i[create update destroy destroy_all]
    )

    property :id
    property :name
    property :order
  end
end

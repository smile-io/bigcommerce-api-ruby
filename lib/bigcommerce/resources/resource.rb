require 'bigcommerce/request'
require 'bigcommerce/resource_actions'
require 'bigcommerce/subresource_actions'

module Bigcommerce
  class Resource < Hashie::Trash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::IgnoreUndeclared

    # Hashie 6 skips the reader for a property whose name is already a method,
    # so `count`, `zip`, `values`, `min`, `max` and `size` would return the
    # Hash method's result instead of the API field.
    def self.property(property_name, options = {})
      super
      return if getters.include?(property_name)

      define_method(property_name) { |&block| self.[](property_name, &block) }
      getters << property_name
    end

    def to_h
      super.reject { |_, value| value.nil? }
    end
  end
end

# Scripts
# Scripts are used to create front-end scripts in Stencil theme
# Need to use connection version v3
# https://developer.bigcommerce.com/api/v3/#/reference/scripts/content-scripts/create-a-script

module Bigcommerce
  class Script < Resource
    include Bigcommerce::ResourceActions.new uri: 'content/scripts/%s'

    property :uuid
    property :name
    property :description
    property :html
    property :src
    property :auto_uninstall
    property :load_method
    property :script_tag
    property :src
    property :location
    property :visibility
    property :kind
    property :date_created
    property :date_modified
    property :api_client_id
  end
end

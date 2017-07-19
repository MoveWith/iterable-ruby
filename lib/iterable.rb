
require 'rubygems'
require 'rest_client'
require 'json'
require 'hashie'
require 'openssl'
require 'base64'

module Iterable
  # autoload :Api, 'iterable/api'
  autoload :VERSION, 'iterable/version'

  # Models
  autoload :User, 'iterable/models/user'
  autoload :DataFields, 'iterable/models/data_fields'
  autoload :ListDetails, 'iterable/models/list_details'
  autoload :CommerceItem, 'iterable/models/commerce_item'

  module Responses
    autoload :General, 'iterable/models/responses/general'
    autoload :Lists, 'iterable/models/responses/lists'
    autoload :Subscribe, 'iterable/models/responses/subscribe'
    autoload :User, 'iterable/models/responses/user'
  end

  module Requests
    autoload :Subscribe, 'iterable/models/requests/subscribe'
    autoload :TrackPurchase, 'iterable/models/requests/track_purchase'
    autoload :UserUpdate, 'iterable/models/requests/user_update'
  end

  module Services
    autoload :BaseService, 'iterable/services/base_service'
    autoload :CommerceService, 'iterable/services/commerce_service'
    autoload :ListService, 'iterable/services/list_service'
    autoload :UserService, 'iterable/services/user_service'
  end  

  module Util
    autoload :Config, 'iterable/util/config'
    autoload :Helpers, 'iterable/util/helpers'
  end
end
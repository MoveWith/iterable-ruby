
require 'rubygems'
require 'rest_client'
require 'json'
require 'hashie'
require 'openssl'
require 'base64'

module Iterable
  autoload :Api, 'iterable/api'
  autoload :VERSION, 'iterable/version'

  # Models
  autoload :Base, 'iterable/models/base'
  autoload :User, 'iterable/models/user'
  autoload :DataFields, 'iterable/models/data_fields'
  autoload :ListDetails, 'iterable/models/list_details'
  autoload :CommerceItem, 'iterable/models/commerce_item'
  autoload :TrackedEvent, 'iterable/models/tracked_event'
  autoload :TargetEmail, 'iterable/models/target_email'
  autoload :MessageType, 'iterable/models/message_type'

  module Responses
    autoload :Error, 'iterable/models/responses/error'
    autoload :General, 'iterable/models/responses/general'
    autoload :Lists, 'iterable/models/responses/lists'
    autoload :Subscribe, 'iterable/models/responses/subscribe'
    autoload :User, 'iterable/models/responses/user'
    autoload :TrackedEvent, 'iterable/models/responses/tracked_event'
    autoload :TargetedEmail, 'iterable/models/responses/targeted_email'
    autoload :SubscriptionUpdate, 'iterable/models/responses/subscription_update'
    autoload :MessageTypes, 'iterable/models/responses/message_types'
  end

  module Requests
    autoload :Subscribe, 'iterable/models/requests/subscribe'
    autoload :TrackPurchase, 'iterable/models/requests/track_purchase'
    autoload :UserUpdate, 'iterable/models/requests/user_update'
    autoload :TrackEvent, 'iterable/models/requests/track_event'
    autoload :TargetedEmail, 'iterable/models/requests/targeted_email'
    autoload :SubscriptionUpdate, 'iterable/models/requests/subscription_update'
  end

  module Services
    autoload :BaseService, 'iterable/services/base_service'
    autoload :CommerceService, 'iterable/services/commerce_service'
    autoload :ListService, 'iterable/services/list_service'
    autoload :MessageTypeService, 'iterable/services/message_type_service'
    autoload :UserService, 'iterable/services/user_service'
    autoload :EventService, 'iterable/services/event_service'
    autoload :EmailService, 'iterable/services/email_service'
  end

  module Exceptions
    autoload :ServiceException, 'iterable/exceptions/service_exception'
  end

  module Util
    autoload :Config, 'iterable/util/config'
    autoload :Helpers, 'iterable/util/helpers'
  end
end

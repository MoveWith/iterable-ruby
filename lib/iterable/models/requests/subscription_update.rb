# Example request
# {
#   "email": "string",
#   "emailListIds": [
#     0
#   ],
#   "unsubscribedChannelIds": [
#     0
#   ],
#   "unsubscribedMessageTypeIds": [
#     0
#   ],
#   "campaignId": 0,
#   "templateId": 0
# }
module Iterable
  module Requests
    class SubscriptionUpdate < Iterable::Base
      property :email, required: true
      property :emailListIds, coerce: Array[Integer]
      property :unsubscribedChannelIds, coerce: Array[Integer]
      property :unsubscribedMessageTypeIds, coerce: Array[Integer]
      property :campaignId, coerce: Integer
      property :templateId, coerce: Integer
    end
  end
end

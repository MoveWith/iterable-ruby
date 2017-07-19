# Example request
# {
#   "user": {
#     "email": "",
#     "dataFields": "Map[string, object]",
#     "userId": "",
#     "mergeNestedObjects": false
#   },
#   "items": [
#     {
#       "id": "",
#       "sku": "",
#       "name": "",
#       "description": "",
#       "categories": [
#         ""
#       ],
#       "price": 0,
#       "quantity": 0,
#       "imageUrl": "",
#       "url": "",
#       "dataFields": "Map[string, object]"
#     }
#   ],
#   "campaignId": 0,
#   "templateId": 0,
#   "total": 0,
#   "createdAt": 0,
#   "dataFields": "Map[string, object]"
# }
module Iterable
  module Requests
    class TrackPurchase < Hashie::Dash
      property :user, coerce: Iterable::Requests::UserUpdate, required: true
      property :items, coerce: Array[Iterable::CommerceItem], required: true
      property :campaignId
      property :templateId
      property :total, required: true
      property :createdAt
      property :dataFields, coerce: DataFields
    end
  end
end
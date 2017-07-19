# Example request
# {  
#   listId": 0,
#   "subscribers": [
#     {
#       "email": "",
#       "dataFields": "Map[string, object]",
#       "userId": ""
#     }
#   ]
# }
module Iterable
  module Requests
    class Subscribe < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion
      property :listId
      property :subscribers, coerce: Array[Iterable::User]
    end
  end
end
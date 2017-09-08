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
    class Unsubscribe < Iterable::Base
      property :listId, coerce: Integer, required: true
      property :subscribers, coerce: Array[Iterable::User]
    end
  end
end

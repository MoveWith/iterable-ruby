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
    class Subscribe < Iterable::Base
      property :listId, coerce: Integer
      property :subscribers, coerce: Array[Iterable::User]
    end
  end
end
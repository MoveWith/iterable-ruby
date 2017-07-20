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
    class UserUpdate < Iterable::User
      property :mergeNestedObjects, default: false
    end
  end
end
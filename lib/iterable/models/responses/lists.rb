# {
#   "lists": [
#     {
#       "id": 0,
#       "name": "",
#       "createdAt": "",
#       "listType": ""
#     }
#   ]
# }
module Iterable
  module Responses
    class Lists < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion
      property :lists, coerce: Array[Iterable::ListDetails]
    end
  end
end
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
    class General < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion
      property :msg
      property :code
      property :params, coerce: Hashie::Mash
    end
  end
end
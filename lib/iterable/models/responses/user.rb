# {
#   "user": {
#     "email": "",
#     "dataFields": "Map[string, object]",
#     "userId": ""
#   }
# }
module Iterable
  module Responses
    class User < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion
      property :user, coerce: Iterable::User
    end
  end
end
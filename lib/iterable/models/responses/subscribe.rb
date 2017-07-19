# {
#   "successCount": 0,
#   "failCount": 0,
#   "invalidEmails": [
#     ""
#   ]
# }
module Iterable
  module Responses
    class Subscribe < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion
      property :successCount
      property :failCount
      property :invalidEmails, coerce: Array[string]
    end
  end
end
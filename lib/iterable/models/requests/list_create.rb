# Example request
# {
#   "name": "list name",
# }
module Iterable
  module Requests
    class ListCreate < Iterable::Base
      property :name, required: true
    end
  end
end

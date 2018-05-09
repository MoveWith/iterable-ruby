module Iterable
  module Responses
    class ListCreate < Iterable::Base
      property :listId, coerce: Integer
    end
  end
end

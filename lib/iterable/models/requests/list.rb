module Iterable
  module Requests
    class List < Iterable::Base
      property :listId, coerce: Integer, required: true
    end
  end
end
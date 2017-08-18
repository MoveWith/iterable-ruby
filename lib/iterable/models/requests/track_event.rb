module Iterable
  module Requests
    class TrackEvent < Iterable::Event
      property :mergeNestedObjects, default: false
    end
  end
end

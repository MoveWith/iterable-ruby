module Iterable
  module Requests
    class TrackEvent < Iterable::TrackedEvent
      property :mergeNestedObjects, default: false
    end
  end
end

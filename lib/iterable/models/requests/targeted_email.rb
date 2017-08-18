module Iterable
  module Requests
    class TargetedEmail < Iterable::TargetEmail
      property :mergeNestedObjects, default: false
    end
  end
end

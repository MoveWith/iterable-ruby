module Iterable
  class TrackedEvent < Iterable::Base
    property :eventName, required: true, coerce: String
    property :email, required: true, coerce: String
    property :dataFields, coerce: DataFields
    property :userId, coerce: String
    property :campaignId, coerce: String
  end
end

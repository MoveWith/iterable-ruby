module Iterable
  class Event < Iterable::Base
    property :email, required: true, coerce: String
    property :userId, coerce: String
    property :campaignId, coerce: String
    property :eventName, required: true, coerce: String
    property :dataFields, coerce: DataFields
  end
end

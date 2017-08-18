module Iterable
  class TargetEmail < Iterable::Base
    property :campaignId, required: true, coerce: String
    property :recipientEmail, required: true, coerce: String
    property :dataFields, coerce: DataFields
  end
end

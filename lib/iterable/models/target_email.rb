module Iterable
  class TargetEmail < Iterable::Base
    property :campaignId, required: true, coerce: Integer
    property :recipientEmail, required: true, coerce: String
    property :dataFields, coerce: DataFields
  end
end

module Iterable
  class Template < Iterable::Base
    property :templateId, coerce: Integer
    property :createdAt
    property :updatedAt
    property :name
    property :messageTypeId, coerce: Integer
    property :campaignId
  end
end

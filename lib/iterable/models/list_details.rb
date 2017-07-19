module Iterable
  class ListDetails < Iterable::Base
    property :id, coerce: Integer
    property :name
    property :createdAt
    property :listType
  end
end
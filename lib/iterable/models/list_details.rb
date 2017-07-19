module Iterable
  class ListDetails < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    property :id
    property :name
    property :createdAt
    property :listType
  end
end
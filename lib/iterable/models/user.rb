module Iterable
  class User < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    property :email, required: true

    property :userId
    
    property :dataFields, coerce: DataFields
  end
end
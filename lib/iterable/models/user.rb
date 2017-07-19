module Iterable
  class User < Iterable::Base
    property :email, required: true, coerce: String

    property :userId, coerce: String
    
    property :dataFields, coerce: DataFields
  end
end
module Iterable
  module Responses
    class Error < Iterable::Base
      property :msg
      property :code
      property :response
      property :params, coerce: Hashie::Mash
    end
  end
end
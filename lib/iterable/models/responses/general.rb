module Iterable
  module Responses
    class General < Iterable::Base
      property :msg
      property :code
      property :params, coerce: Hashie::Mash
    end
  end
end
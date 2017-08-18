module Iterable
  module Responses
    class TargetedEmail < Iterable::Base
      property :msg
      property :code
      property :params, coerce: Hashie::Mash
    end
  end
end

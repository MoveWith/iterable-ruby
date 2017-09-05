module Iterable
  module Responses
    class SubscriptionUpdate < Iterable::Base
      property :msg
      property :code
      property :params, coerce: Hashie::Mash
    end
  end
end

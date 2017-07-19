module Iterable
  class Base < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    include Hashie::Extensions::Dash::PropertyTranslation

    def initialize(hash = {})
      # ensure we symbolize keys 
      super(Hashie.symbolize_keys!(hash))
    end
  end
end
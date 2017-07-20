module Iterable
  module Responses
    class Lists < Iterable::Base
      property :lists, coerce: Array[Iterable::ListDetails]
    end
  end
end
module Iterable
  module Responses
    class Templates < Iterable::Base
      property :templates, coerce: Array[Iterable::Template]
    end
  end
end

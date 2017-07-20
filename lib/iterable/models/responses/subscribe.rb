module Iterable
  module Responses
    class Subscribe < Iterable::Base
      property :successCount
      property :failCount
      property :invalidEmails, coerce: Array[String]
    end
  end
end
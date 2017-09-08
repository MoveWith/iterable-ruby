module Iterable
  module Responses
    class Unsubscribe < Iterable::Base
      property :successCount
      property :failCount
      property :invalidEmails, coerce: Array[String]
    end
  end
end

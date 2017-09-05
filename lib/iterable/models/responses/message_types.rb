module Iterable
  module Responses
    class MessageTypes < Iterable::Base
      property :message_types, coerce: Array[Iterable::MessageType]
    end
  end
end

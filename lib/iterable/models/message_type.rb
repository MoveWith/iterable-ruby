module Iterable
  class MessageType < Iterable::Base
    property :id, coerce: Integer
    property :name
    property :channelId
  end
end

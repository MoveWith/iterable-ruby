module Iterable
  module Responses
    class User < Iterable::Base
      property :user, coerce: Iterable::User
    end
  end
end
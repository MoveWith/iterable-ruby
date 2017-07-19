#
# list_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class ListService < BaseService
      class << self
        def all
          get(Util::Config.get('endpoints.lists'), nil, Iterable::Responses::Lists)
        end

        def subscribe(list_id, subscribers)
          request = Iterable::Requests::Subscribe.new(listId: list_id, subscribers: subscribers)
          post(Util::Config.get('endpoints.lists_subscribe'), request, nil, Iterable::Responses::Subscribe)
        end
      end
    end
  end
end

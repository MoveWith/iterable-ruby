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
          url = Util::Config.get('endpoints.base_url') + Util::Config.get('endpoints.lists')
          url = build_url(url)
          response = RestClient.get(url, get_headers())
          Iterable::Responses::Lists.new JSON.parse(response.body)
        end

        def subscribe(list_id, subscribers)
          request = Iterable::Requests::Subscribe.new(listId: list_id, subscribers: subscribers)
          url = Util::Config.get('endpoints.base_url') + Util::Config.get('endpoints.lists_subscribe')
          url = build_url(url, params)
          response = RestClient.post(url, request.to_json, get_headers())
          Iterable::Responses::Subscribe.new JSON.parse(response.body)
        end
      end
    end
  end
end

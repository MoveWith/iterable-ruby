#
# list_service.rb
# Iterable
#
# Copyright (c) 2018 MoveWith. All rights reserved.

module Iterable
  module Services
    class ListService < BaseService
      class << self
        def all
          get(Util::Config.get('endpoints.lists'), nil, Iterable::Responses::Lists)
        end

        def find_by_id(id)
          # iterate over all lists to find the id
          all.lists.select{|x| x.id == id.to_i}.first
        end

        def subscribe(list_id, subscribers)
          request = Iterable::Requests::Subscribe.new(listId: list_id, subscribers: subscribers)
          post(Util::Config.get('endpoints.lists_subscribe'), request, nil, Iterable::Responses::Subscribe)
        end

        def unsubscribe(list_id, subscribers)
          request = Iterable::Requests::Unsubscribe.new(listId: list_id, subscribers: subscribers)
          post(Util::Config.get('endpoints.lists_unsubscribe'), request, nil, Iterable::Responses::Unsubscribe)
        end

        def create(list_name)
          request = Iterable::Requests::ListCreate.new(name: list_name)
          post(Util::Config.get('endpoints.list_create'), request, nil, Iterable::Responses::ListCreate)
        end

        def get_users(list_id)
          raise Exceptions::ServiceException, "Id is required." if list_id.nil?
          request = Iterable::Requests::List.new(listId: list_id)
          get(Util::Config.get('endpoints.list_users'), request, nil)
        end

      end
    end
  end
end

#
# user_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class UserService < BaseService
      class << self
        def find_by_email(email)
          raise Exceptions::ServiceException, "Email is required." if email.nil?

          url = Util::Config.get('endpoints.base_url') + (Util::Config.get('endpoints.user_by_email') % [email])
          url = build_url(url)
          response = RestClient.get(url, get_headers())
          Iterable::Responses::User.new JSON.parse(response.body)
        end

        def find_by_id(id)
          raise Exceptions::ServiceException, "Id is required." if id.nil?

          url = Util::Config.get('endpoints.base_url') + (Util::Config.get('endpoints.user_by_id') % [id])
          url = build_url(url)
          response = RestClient.get(url, get_headers())
          Iterable::Responses::User.new JSON.parse(response.body)
        end

        def update(user)
          url = Util::Config.get('endpoints.base_url') + Util::Config.get('endpoints.user_update')
          url = build_url(url, params)
          response = RestClient.post(url, user.to_json, get_headers())
          Iterable::Responses::General.new JSON.parse(response.body)
        end
      end
    end
  end
end
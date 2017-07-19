#
# commerce_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class CommerceService < BaseService
      class << self
        def track_purchase(request)
          url = Util::Config.get('endpoints.base_url') + Util::Config.get('endpoints.user_update')
          url = build_url(url, params)
          response = RestClient.post(url, request.to_json, get_headers())
          Iterable::Responses::General.new JSON.parse(response.body)
        end
      end
    end
  end
end
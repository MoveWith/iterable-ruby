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
          raise Exceptions::ServiceException, "Must be a Iterable::Requests::TrackPurchase" unless user.is_a?(Iterable::Requests::TrackPurchase)
          post(Util::Config.get('endpoints.track_purchase'), request)
        end
      end
    end
  end
end
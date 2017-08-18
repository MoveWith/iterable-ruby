#
# list_service.rb
# Iterable
#
# Copyright (c) 2017 MoveWith. All rights reserved.

module Iterable
  module Services
    class EventService < BaseService
      class << self
        def track(request)
          puts "********** DEBUG START"
          puts request
          puts "********** DEBUG END"
          raise Exceptions::ServiceException, "Must be a Iterable::Requests::TrackEvent" unless request.is_a?(Iterable::Requests::TrackEvent)
          post(Util::Config.get('endpoints.track_event'), request)
        end
      end
    end
  end
end

#
# email_service.rb
# Iterable
#
# Copyright (c) 2017 MoveWith. All rights reserved.

module Iterable
  module Services
    class EmailService < BaseService
      class << self
        def send_email(request)
          raise Exceptions::ServiceException, "Must be a Iterable::Requests::TargetedEmail" unless request.is_a?(Iterable::Requests::TargetEmail)
          post(Util::Config.get('endpoints.send_email'), request)
        end
      end
    end
  end
end

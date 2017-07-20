#
# api.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  class Api
    # Class constructor
    # @param [String] api_key - Iterable API Key
    # @return
    def initialize(api_key = nil)
      Services::BaseService.api_key = api_key || Util::Config.get('auth.api_key')
      if Services::BaseService.api_key.nil? || Services::BaseService.api_key == ''
        raise ArgumentError.new(Util::Config.get('errors.api_key_missing'))
      end
    end

    # 
    # List Services
    # 
    def lists
      Services::ListService.all
    end

    def lists_subscribe(list_id, subscribers)
      Services::ListService.subscribe(list_id, subscribers)
    end

    def list_by_id(list_id)
      Services::ListService.find_by_id(list_id)
    end

    # 
    # User Services
    # 
    def user_by_email(email)
      Services::UserService.find_by_email(email)
    end

    def user_by_id(id)
      Services::UserService.find_by_id(id)
    end

    def user_update(user)
      Services::UserService.update(user)
    end

    def user_subscriptions_update
    end

    # 
    # Commerce Services
    # 
    def track_purchase(track_purchase_request)
      raise Exceptions::ServiceException, "Must be a Iterable::Requests::TrackPurchase" unless user.is_a?(Iterable::Requests::TrackPurchase)
      Services::CommerceService.track_purchase(track_purchase_request)
    end
  end
end

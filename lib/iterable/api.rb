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

    # Event Services
    def track_event(track_event_request)
      Services::EventService.track(track_event_request)
    end

    # Email Services
    def send_email(targeted_email_request)
      Services::EmailService.send_email(targeted_email_request)
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
    # MessageType Services
    #
    def message_types
      Services::MessageTypeService.all
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

    def user_fields
      Services::UserService.fields
    end

    def user_update_subscriptions(subscription_request)
      puts "***********************"
      puts "UPDATE SUBSCRIPTIONS"
      puts subscription_request
      puts "***********************"
      Services::UserService.update_subscription(subscription_request)
    end

    def unsubscribe_all(email)
      puts "ITERABLE GEM EMAIL: #{email}"
      if !email.blank?
        # Get all message types
        iterable_message_types = message_types
        if iterable_message_types && iterable_message_types["messageTypes"]
          message_type_ids = iterable_message_types.collect { |message_type| message_type["id"] }
          if !message_type_ids.blank?
            subscription_request = Iterable::Requests::SubscriptionUpdate.new({
              email: email,
              unsubscribedMessageTypeIds: message_type_ids
            })
            puts "***********************"
            puts "SUBSCRIPTION REQUEST"
            puts subscription_request
            puts "***********************"
            user_update_subscription(subscription_request)
          end
        end
      end
    end

    #
    # Commerce Services
    #
    def track_purchase(track_purchase_request)
      Services::CommerceService.track_purchase(track_purchase_request)
    end
  end
end

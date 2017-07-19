#
# config.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Util
    class Config

      # Return a hash of configuration strings
      # @return [Hash] - hash of configuration properties
      @props = {
        # REST endpoints
        :endpoints => {
          :base_url                       => 'https://api.iterable.com:443/api/',

          # subscribers (users)
          :user_by_email                  => 'users/%s',
          :user_by_id                     => 'users/byUserId/%s',
          :user_update                    => 'users/update',
          :user_subscriptions_update      => 'users/updateSubscriptions',

          # subscriptions (lists)
          :lists                          => 'lists',
          :lists_subscribe                => 'lists/subscribe',

          # purchases (commerce)
          :track_purchase                 => 'commerce/trackPurchase',
        },

        # Authorization related configuration options
        :auth => {
          :api_key                       => ''
        },

        # Errors to be returned for various exceptions
        :errors => {
          :api_key_missing      => 'api_key required either explicitly or in configuration.',
        }
      }

      class << self
        attr_accessor :props

        def configure 
          yield props if block_given?
        end

        # Get a configuration property given a specified location, example usage: Config::get('auth.token_endpoint')
        # @param [String] index - location of the property to obtain
        # @return [String]
        def get(index)
          properties = index.split('.')
          get_value(properties, props)
        end

        private

        # Navigate through a config array looking for a particular index
        # @param [Array] index The index sequence we are navigating down
        # @param [Hash, String] value The portion of the config array to process
        # @return [String]
        def get_value(index, value)
          index = index.is_a?(Array) ? index : [index]
          key = index.shift.to_sym
          value.is_a?(Hash) and value[key] and value[key].is_a?(Hash) ?
          get_value(index, value[key]) :
          value[key]
        end
      end
    end
  end
end
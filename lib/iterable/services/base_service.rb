#
# base_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class BaseService
      class << self
        attr_accessor :api_key

        protected

        def get(path, params = {}, response_type = Iterable::Responses::General)
          url = URI::join(Util::Config.get('endpoints.base_url'), path).to_s
          url = build_url(url, params)
          response = RestClient.get(url, get_headers())
          begin
            response_type.new JSON.parse(response.body)
          rescue
            Hashie::Mash.new JSON.parse(response.body)
          end
        end

        def post(path, body = {}, params = {}, response_type = Iterable::Responses::General)
          url = URI::join(Util::Config.get('endpoints.base_url'), path).to_s
          url = build_url(url, params)
          puts "***** POST DEBUG"
          puts "URL: #{url}"
          response = RestClient.post(url, body.to_json, get_headers())
          puts "RESPONSE:"
          puts response
          begin
            response_type.new JSON.parse(response.body)
          rescue
            puts "ERROR"
            puts response.inspect
            Hashie::Mash.new JSON.parse(response.body)
          end
          puts "***** POST DEBUG"
        end

        # Return required headers for making an http request with Iterable
        # @param [String] content_type - The MIME type of the body of the request, default is 'application/json'
        # @return [Hash] - authorization headers
        def get_headers(content_type = 'application/json')
          {
            :content_type           => content_type,
            :accept                 => 'application/json',
            :user_agent             => "Iterable Ruby SDK v#{Iterable::VERSION} (#{RUBY_DESCRIPTION})",
            :x_ctct_request_source  => "sdk.ruby.#{Iterable::VERSION}",
            'Api-Key'               => BaseService.api_key
          }
        end

        # Build a url from the base url and query parameters hash. Query parameters
        # should not be URL encoded because this method will handle that
        # @param [String] url - The base url
        # @param [Hash] params - A hash with query parameters
        # @return [String] - the url with query parameters hash
        def build_url(url, params = nil)
          if params.respond_to? :each
            params.each do |key, value|
              # Convert dates to CC date format
              if value.respond_to? :iso8601
                params[key] = value.iso8601
              end

              if key.to_s == 'next' && value.match(/^.*?next=(.*)$/)
                params[key] = $1
              end
            end
          else
            params ||= {}
          end
          url + '?' + Util::Helpers.http_build_query(params)
        end
      end
    end
  end
end

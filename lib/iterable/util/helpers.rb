#
# helpers.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Util
    class Helpers
      class << self

        # Build the HTTP query from the given parameters
        # @param [Hash] params
        # @return [String] query string
        def http_build_query(params)
          params.collect{ |k,v| "#{k}=#{encode(v.to_s)}" }.reverse.join('&')
        end

        # Escape special characters
        # @param [String] str
        def encode(str)
          CGI.escape(str).gsub('.', '%2E').gsub('-', '%2D')
        end
      end
    end
  end
end
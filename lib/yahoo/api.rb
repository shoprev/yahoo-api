require "net/http"
require "uri"
require "cgi"
require "json"
require 'active_support/core_ext'
require "yahoo/api/version"
require "yahoo/api/response"
require "yahoo/api/request"
require "yahoo/api/shopping"
require "yahoo/api/news"

module Yahoo

  class Api

    @@options = {}

    class << self

      def options
        @@options
      end

      def configure(&proc)
        raise ArgumentError, "Block is required." unless block_given?
        yield @@options
      end

      def merge(opts={})
        opts.merge!(@@options)
        ids = opts[:appid].split(",")
        opts[:appid] = ids[rand(ids.size)]
        opts
      end

      def get(method,opts={})
        eval "#{method}(#{opts})"
      end

    end

  end

end
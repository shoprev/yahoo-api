require "net/http"
require "uri"
require "cgi"
require "json"
require "yahoo/api/version"
require "yahoo/api/response"
require "yahoo/api/request"
require "yahoo/api/shopping"
require "yahoo/api/auction"

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

      def get(method,opts={})
        eval "#{method}(#{opts})"
      end

    end

  end

end
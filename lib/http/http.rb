require 'httparty'

module HTTP

  class Basement
    include HTTParty
  end

  class Response

    attr_accessor :parsed_body, :code, :headers, :http_response

    def initialize(body, code, headers, response)
      self.parsed_body = body
      self.code = code
      self.headers = headers
      self.http_response = response
    end
  end

  class Client
    class << self

      def base_uri=(value)
        Basement.base_uri value
      end

      def get(path, options = {})
        res = Basement.get(path, options);
        Response.new res.parsed_response, res.code, res.headers, res.response
      end

      def post(path, options = {})
        res = Basement.post(path, options);
        Response.new res.parsed_response, res.code, res.headers, res.response
      end

      def base_uri
        Basement.default_options[:base_uri].sub 'http://', ''
      end

      def basic_auth(u, v)
        Basement.basic_auth u, v
      end

      def options
        Basement.default_options
      end

      # force httparty to add the 'http://' to base uri
      base_uri = ''
    end
  end
end

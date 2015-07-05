require 'httparty'

module HTTP

  class Basement
    include HTTParty
  end

  class Client
    class << self

      def base_uri=(value)
        Basement.base_uri value
      end

      def get(path, options = {})
        Basement.get(path, options);
      end

      def post(path, options = {})
        Basement.post(path, options);
      end

      def base_uri
        Basement.default_options[:base_uri].sub 'http://', ''
      end

      def basic_auth(u, v)
        Basement.basic_auth u, v
      end

      # force httparty to add the 'http://' to base uri
      base_uri = ''
    end
  end
end

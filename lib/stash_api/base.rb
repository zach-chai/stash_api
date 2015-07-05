module StashAPI
  class Base
    class << self

      def domain(value = nil)
        return Options.option(:domain) unless value
        Options.option :domain, value
      end

      def basic_auth(u, v)
        HTTP::Client.basic_auth u, v
      end
    end
  end
end

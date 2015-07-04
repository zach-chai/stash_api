module StashAPI
  class Base
    class << self

      def domain(value = nil)
        return Options.option(:domain) unless value
        Options.option :domain, value
      end
    end
  end
end

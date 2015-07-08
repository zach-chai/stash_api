module StashAPI
  class Repo < Resource
    class << self

      def repos(key = nil)
        add_resource 2, 'pull-request', key

        if key.nil?
          self
        else
          self # change this to the next resource in the chain
        end
      end
    end
  end
end
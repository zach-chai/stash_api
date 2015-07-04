module StashAPI
  class Project < Resource
    class << self

      def repos(key = nil)
        add_resource 1, 'repos', key

        if key.nil?
          self
        else
          Repo
        end
      end

    end
  end
end

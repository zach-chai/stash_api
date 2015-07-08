module StashAPI
  class Core < Resource
    class << self

      def projects(key = nil)
        add_resource 0, 'projects', key

        if key.nil?
          self
        else
          Project
        end
      end

    end
  end
end

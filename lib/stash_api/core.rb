module StashAPI
  class Core < Resource
    class << self
      @@position = 0

      def projects(id = nil)
        add_resource_to_chain @@position, 'projects', id
        Project
      end

      def users(id = nil)
        add_resource_to_chain @@position, 'users', id
        User
      end

    end
  end
end

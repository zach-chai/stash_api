module StashAPI
  class Core < Resource
    class << self

      def projects(id = nil)
        add_resource_to_chain 0, 'projects', id
        Project
      end
    end
  end
end

module StashAPI
  class Project < Resource
    class << self
      @@position = 1

      def repos(id = nil)
        raise_resource_key_missing if resource_id(@@position - 1) == nil
        add_resource_to_chain @@position, 'repos', id
        Repo
      end
    end
  end
end

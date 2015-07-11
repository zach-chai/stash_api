module StashAPI
  class PullRequest < Resource
    class << self
      @@position = 3

      def comments(id = nil)
        raise_resource_key_missing if resource_id(@@position - 1) == nil
        add_resource_to_chain @@position, 'comments', id
        Comment
      end
    end
  end
end

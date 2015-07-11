module StashAPI
  class Repo < Resource
    class << self
      @@position = 2

      def pull_requests(id = nil)
        raise_resource_key_missing if resource_id(@@position - 1) == nil
        add_resource_to_chain @@position, 'pull-requests', id
        PullRequest
      end
    end
  end
end
module StashAPI
  class Resource
    @@resources = []
    @@resource_keys = []

    def self.fetch(options = {})

      # TODO add options to request
      response = HTTP::Client.get build_resource_path

      if response.code == 200
        response.parsed_response
      else
        response.code
      end
    end

    def self.build_resource_path
      path = '/api/1.0'
      for i in 0..@@resources.size
        path << "/#{@@resources[i]}"
        path << "/#{@@resource_keys[i]}" if @@resource_keys[i]
      end
      path
    end

    def self.add_resource(index, resource, key = nil)
      @@resources[index] = "#{resource}"
      @@resource_keys[index] = key
    end

    def self.reset_resource_chain
      @@resources = []
      @@resource_keys = []
    end

    reset_resource_chain
  end
end

module StashAPI
  class Resource
    @@resources = []
    @@resource_ids = []

    def self.fetch(query = {})
      options = {}
      options[:query] = query

      response = HTTP::Client.get resource_path, options
      reset_resource_chain

      if response.code == 200
        response.parsed_response
      else
        response.code
      end
    end

    def self.create_resource(payload, options = {})

      options[:body] = payload.to_json
      options[:headers] = {"Content-Type" => "application/json"}

      response = HTTP::Client.post resource_path, options

      response
    end

    def self.resource_path
      path = '/api/1.0'
      for i in 0..@@resources.size
        path << "/#{@@resources[i]}" if @@resources[i]
        path << "/#{@@resource_ids[i]}" if @@resource_ids[i]
      end
      path
    end

    def self.add_resource_to_chain(index, resource, key = nil)
      @@resources[index] = "#{resource}"
      @@resource_ids[index] = key
    end

    def self.reset_resource_chain
      @@resources = []
      @@resource_ids = []
    end

    def self.resource(pos)
      @@resources[pos]
    end

    def self.resource_id(pos)
      @@resource_ids[pos]
    end

    def self.raise_resource_key_missing
      raise 'previous resource has no key to allow chaining'
    end

    reset_resource_chain
  end
end

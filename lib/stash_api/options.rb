module StashAPI
  class Options
    @@default_options = {}

    def self.options 
      @@default_options
    end

    def self.option(key, value = nil)
      return @@default_options[key] unless value
      @@default_options[key] = value

      if key == :domain
        build_base_uri
      end

      value
    end

    def self.reset_defaults
      @@default_options = {}
      build_base_uri # reset the base_uri
    end

    private

    def self.build_base_uri
      if @@default_options[:domain].nil?
        HTTP::Client.base_uri = ''
      else
        HTTP::Client.base_uri = "#{@@default_options[:domain]}/rest"
      end
    end

    # set any defaults
    reset_defaults
  end
end

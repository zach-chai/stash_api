require 'httparty'

module HTTP

	class Basement
		include HTTParty
	end

	class Client
		class << self
			
			def host= newHost
				Basement.base_uri newHost
			end

			def get path, options = {}
				Basement.get(path, options);
			end

			def post path, options = {}
				Basement.post(path, options);
			end
		end
	end
end

# HTTP::Client.host = 'google.ca'
# puts HTTP::Client.get '/'

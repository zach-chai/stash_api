module StashAPI
  class Comment < Resource
    class << self

      def create(text, options = {})
        options[:text] = text

        create_resource options
      end
    end
  end
end

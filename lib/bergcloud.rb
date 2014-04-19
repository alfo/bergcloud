require "net/http"
require "json"

require "bergcloud/version"
require "bergcloud/error"
require "bergcloud/client"
require "bergcloud/project"
require "bergcloud/event"
require "bergcloud/command"

module BERGCloud

  class << self

    def new(options = {})
      BERGCloud::Client.api_token = options[:api_token]
    end
  end

end

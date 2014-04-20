module BERGCloud
  class Command

    attr_reader :command_id

    def initialize(command_id)
      @command_id = command_id
    end

    def info
      BERGCloud::Client.get("/commands/#{@command_id}").body
    end

    def delete
      BERGCloud::Client.delete("/commands/#{@command_id}").body
    end

  end
end

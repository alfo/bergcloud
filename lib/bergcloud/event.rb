module BERGCloud
  class Event

    attr_reader :event_id

    def initialize(event_id)
      @event_id = event_id
    end

    def info
      BERGCloud::Client.get("/commands/#{@event_id}").body
    end

  end
end

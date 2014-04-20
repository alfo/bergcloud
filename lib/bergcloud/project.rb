module BERGCloud
  class Project

    attr_reader :project_id

    def initialize(project_id)
      @project_id = project_id
    end

    def valid?
      res = BERGCloud::Client.get("/projects/#{@project_id}")
      res.code == "200"
    end

    def claim(claim_code)
      BERGCloud::Client.post("/projects/#{@project_id}/claims/#{claim_code}").body
    end

    def claim_status(claim_code)
      BERGCloud::Client.get("/projects/#{@project_id}/claims/#{claim_code}").body
    end

    def devices
      BERGCloud::Client.get("/projects/#{@project_id}/devices").body
    end

    def events
      BERGCloud::Client.get("/projects/#{@project_id}/events").body
    end

    def send_command(options)
      raise BERGCloud::Error::ParamsError, "Command must include a payload, name and device_id" unless options[:payload] and options[:device_id] and options[:name]
      BERGCloud::Client.post("/projects/#{@project_id}/commands", options).body
    end

  end
end

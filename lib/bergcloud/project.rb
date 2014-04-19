module BERGCloud
  class Project

    attr_reader :project_id

    def initialize(project_id)
      @project_id = project_id
    end

    def info
      BERGCloud::Client.get("/projects/#{@project_id}")
    end

    def claim(claim_code)
      BERGCloud::Client.post("/projects/#{@project_id}/claims/#{claim_code}")
    end

    def claim_info(claim_code)
      BERGCloud::Client.get("/projects/#{@project_id}/claims/#{claim_code}")
    end

    def devices
      BERGCloud::Client.get("/projects/#{@project_id}/devices")
    end

    def events
      BERGCloud::Client.get("/projects/#{@project_id}/events")
    end

    def send_command(options)
      BERGCloud::Client.post("/projects/#{@project_id}/commands", options)
    end

  end
end

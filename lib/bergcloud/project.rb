module BERGCloud
  class Project

    attr_reader :project_id

    def initialize(project_id)
      @project_id = project_id
    end

    def valid?
      res = BERGCloud::Client.get("/projects/#{@project_id}")
      if res.code == "200"
        true
      else
        false
      end
    end

    def claim(claim_code)
      res = BERGCloud::Client.post("/projects/#{@project_id}/claims/#{claim_code}")
      puts res[:body]
    end

    def claim_info(claim_code)
      res = BERGCloud::Client.get("/projects/#{@project_id}/claims/#{claim_code}")
      puts res[:body]
    end

    def devices
      res = BERGCloud::Client.get("/projects/#{@project_id}/devices")
      puts res[:body]
    end

    def events
      res = BERGCloud::Client.get("/projects/#{@project_id}/events")
      puts res.
    end

    def send_command(options)
      res = BERGCloud::Client.post("/projects/#{@project_id}/commands", options)
      puts res.body
    end

  end
end

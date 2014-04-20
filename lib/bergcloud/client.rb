module BERGCloud

  class Client

    attr_accessor :api_token

    def self.api_token=(api_token)
      @api_token = api_token
    end

    def self.get(path, params = {})
      request(path, params, 'get')
    end

    def self.post(path, params = {})
      request(path, params, 'post')
    end

    def self.delete(path, params = {})
      request(path, params, 'delete')
    end

    def self.put(path, params = {})
      request(path, params, 'put')
    end

    private

    def self.request(path, params = {}, method)

      http = Net::HTTP.new(self.host)

      path = self.base_url + path

      puts path

      # Make a request object

      case method
      when 'post'
        req = Net::HTTP::Post.new(path)
        req.set_form_data(params)
      when 'get'
        req = Net::HTTP::Get.new(path)
      when 'delete'
        req = Net::HTTP::Delete.new(path)
      when 'put'
        req = Net::HTTP::Put.new(path)
        req.set_form_data(params)
      end


      # Set the required headers
      req['Accept'] = 'application/json'
      req['Content-Type'] = 'application/json'
      req['Berg-API-Token'] = @api_token

      res = http.request(req)

      case res.code.to_i
      when 200, 404
        res.body = JSON.parse(res.body) rescue []
      when 400, 422
        puts "Malformed request"
        raise BERGCloud::Error, "Malformed request"
      when 500
        puts "Server Error"
        raise BERGCloud::Error, "Server error"
      else
        puts "Something else went wrong"
        raise BERGCloud::Error, "Something else went wrong"
      end

      return res

    end

    def self.base_url
      "/api/v2"
    end

    def self.host
      "api.bergcloud.com"
    end

  end

end

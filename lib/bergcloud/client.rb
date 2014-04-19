module BERGCloud

  class Client

    attr_accessible :api_token

    def self.api_token=(api_token)
      @api_token = api_token
    end

    def get(path, params = {})
      request(path, params, 'get')
    end

    def post(path, params = {})
      request(path, params, 'post')
    end

    def delete(path, params = {})
      request(path, params, 'delete')
    end

    def put(path, params = {})
      request(path, params, 'put')
    end

    private

    def request(path, params = {}, method)

      http = Net::HTTP.new(self.host)

      path = self.base_url + path

      # Make a request object

      case method
      when 'post'
        req = Net:HTTP::Post.new(path)
        req.set_form_data(params)
      when 'get'
        req = Net:HTTP::Get.new(path)
      when 'delete'
        req = Net:HTTP::Delete.new(path)
      when 'put'
        req = Net:HTTP::Put.new(path)
        req.set_form_data(params)
      end


      # Set the required headers
      req['Accept'] = 'application/json'
      req['Content-Type'] = 'application/json'
      req['Berg-API-Token'] = @api_token

      res = http.request(req)

      case res.code
      when 200
        return JSON.parse(res.body)
      when 400, 422
        raise BERGCloud::Error, "Malformed request"
      when 404
        raise BERGCloud::Error, "Not found"
      when 500
        raise BERGCloud::Error, "Server error"
      else
        raise BERGCloud::Error, "Something else went wrong"
      end

    end

    def self.base_url
      "/api/v2"
    end

    def self.host
      "api.bergcloud.com"
    end

  end

end

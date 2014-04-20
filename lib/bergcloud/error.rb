module BERGCloud
  class Error < StandardError

    class ParamsError < BERGCloud::Error

    end

    class RequestError < BERGCloud::Error

    end

  end
end

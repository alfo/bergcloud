module BERGCloud
  class Error < StandardError
    attr_reader :object

    def initialize(object = nil)
      @object = object if object
    end

  end
end

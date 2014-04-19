module BERGCloud
  class Error < StnadardError
    attr_reader :object

    def initialize(object = nil)
      @object = object if object
    end

  end
end

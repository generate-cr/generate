module Generate
  struct View
    property config

    def initialize(@config)
    end

    # @abstract
    def render
    end
  end
end

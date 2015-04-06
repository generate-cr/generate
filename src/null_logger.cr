require "logger"

module Generate
  class NullIO
    include IO

    def <<(message)
      self
    end

    def close
    end

    def puts
    end

    def write(*args)
    end
  end

  NULL_IO = NullIO.new
  NULL_LOGGER = Logger.new(NULL_IO)
end

require "logger"
require "./null_logger"

module Generate
  DEFAULT_LOGGER = Logger.new(STDOUT)

  module Registry
    extend self

    def add_logger(name, logger)
      loggers[name] = logger
    end

    def logger(name)
      loggers.fetch(name)
    end

    private def loggers
      @@_loggers ||= {} of String => Logger
    end
  end

  Registry.add_logger("default", DEFAULT_LOGGER)
  Registry.add_logger("null", NULL_LOGGER)
end

require "logger"
require "./null_logger"

module Generate
  DEFAULT_LOGGER = Logger.new(STDOUT)

  module Registry
    extend self

    macro registry_of(name, type)
      def add_{{name}}(name, {{name}})
        {{name}}s[name] = {{name}}
      end

      def {{name}}(name)
        {{name}}s.fetch(name)
      end

      def {{name}}s
        @@_{{name}}s ||= {} of String => {{type}}
      end
    end

    registry_of logger, Logger
    registry_of runner, RunnerFactory
  end

  Registry.add_logger("default", DEFAULT_LOGGER)
  Registry.add_logger("null", NULL_LOGGER)
end

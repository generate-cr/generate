require "./view"
require "./registry"

module Generate
  class Runner
    property raw_config

    # @abstract with default implementation
    def config
      raw_config
    end

    # @abstract
    def views
      [View]
    end

    def initialize(@raw_config)
    end

    def run
      views.each do |view|
        view.new(config, logger).render_with_log
      end
      true
    end

    def logger
      Registry.logger(raw_config[:logger])
    end
  end

  class RunnerFactory
    abstract def parse_opts(opts)
    abstract def build(raw_config)
    abstract def default_config
  end
end

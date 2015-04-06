require "./view"
require "./registry"

module Generate
  struct Runner
    property raw_config

    # @abstract
    def config
    end

    # @abstract
    def views
      [View]
    end

    def initialize(@raw_config)
    end

    def run
      views.each do |view|
        view.new(config).render
      end
      true
    end

    def logger
      Registry.logger(raw_config[:logger])
    end
  end
end

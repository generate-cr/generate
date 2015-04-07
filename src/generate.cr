require "option_parser"

module Generate
  extend self

  def run(args, raw_config = {} of Symbol => String)
    runner = Registry.runner(args.shift)

    OptionParser.parse(args) do |opts|
      opts.on("--logger=LOGGER", "Logger to use, one of: #{Registry.loggers.inspect}") do |logger|
        raw_config[:logger] = logger
      end

      runner.parse_opts(opts)
    end

    final_config = raw_config.merge(runner.default_config.merge(runner.raw_config))
    runner.build(final_config).run
  end

  def run!
    run(ARGV)
  end
end

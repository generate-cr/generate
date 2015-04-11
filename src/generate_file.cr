require "./runner"
require "./generate_file/*"

module Generate
  module GenerateFile
    DIR = "./.generate"

    class Runner < Generate::Runner
      def views
        [
         DirsView,
         ProjectfileView,
         GeneratefileView,
        ]
      end

      def config
        @_config ||= Config.new
      end
    end

    struct Config
      property contents
      property argv

      def initialize
        @contents = Contents.new
        @argv = ARGV
      end
    end

    class Executer
      def run
        puts `cd #{DIR} && crystal deps && crystal build ./Generatefile`
        puts `./#{DIR}/Generatefile`
      end
    end

    struct Dependency
      property name
      property github

      def initialize(@name, @github)
      end
    end

    class Contents
      def initialize
        {{ `cat Generatefile` }}
      end

      def deps
        @_deps ||= [] of Dependency
      end

      def template(name, github)
        deps << Dependency.new(name, github)
      end
    end

    def self.run!
      Runner.new({ :logger => "default" }).run
      Executer.new.run
    end
  end
end

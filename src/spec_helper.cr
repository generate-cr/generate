module Generate
  module SpecHelper
    struct DescribedFile
      property path
      property run_once

      def initialize(@path, @run_once)
      end

      def should(matcher)
        contents.should(matcher)
      end

      def contents
        @_contents ||= _contents
      end

      def _contents
        run_once.call
        File.read(path)
      end
    end

    class IncludeExpectation
      getter value
      getter target

      def initialize(@value)
      end

      def match(target)
        @target = target
        target.to_s.includes?(value)
      end

      def failure_message
        "expected %{#{target}} to include %{#{value}}"
      end

      def negative_failure_message
        "expected %{#{target}} not to include %{#{value}}"
      end
    end
  end
end

def be_including(value)
  Generate::SpecHelper::IncludeExpectation.new(value)
end

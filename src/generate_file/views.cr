require "../view"

module Generate
  module GenerateFile
    struct View < Generate::FileView
      def full_path
        "#{DIR}/#{path}"
      end

      def log
      end
    end

    struct DirsView < Generate::View
      def render
        Dir.mkdir_p(DIR)
      end

      def log
      end
    end

    generate_template ProjectfileView, View, "generate", "generate_file/Projectfile.ecr", "Projectfile"
    generate_template GeneratefileView, View, "generate", "generate_file/Generatefile.ecr", "Generatefile"
  end
end

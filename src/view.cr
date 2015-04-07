macro generate_abstract_def(signature)
  def {{signature.id}}
    fail "Abstract method \#{{signature.id}} called on #{self.class}"
  end
end

module Generate
  struct View
    property config
    property logger

    generate_abstract_def render
    generate_abstract_def log

    def initialize(@config, @logger)
    end

    def render_with_log
      log
      render
    end
  end

  struct FileView < View
    generate_abstract_def path
    generate_abstract_def to_s(io)
    generate_abstract_def full_path

    def render
      File.write(full_path, to_s)
    end

    def log
      logger.info("File #{full_path}")
    end
  end
end

macro generate_template(name, base, template, path)
  struct {{name.id}} < {{base.id}}
    ecr_file "{{__DIR__.id}}/{{template.id}}"

    def path
      {{path}}
    end
  end
end

module Generate
  struct View
    property config
    property logger

    abstract def render
    abstract def log

    def initialize(@config, @logger)
    end

    def render_with_log
      log
      render
    end
  end

  struct FileView < View
    abstract def path
    abstract def to_s(io)
    abstract def full_path

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

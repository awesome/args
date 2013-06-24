#!/usr/bin/env ruby
class Args
  def initialize
    @args = {}
  end

  def add_arg(k, arity)
    @args[k] = arity == 1 ? ":" : ""
  end

  def parse(args)
    cmd = %<set -- #{args.map {|a| "\"#{a}\""}.join(" ")}; while getopts :#{to_getopts} arg; do\n>
    cmd << "case \"$arg\" in\n"
    @args.each do |k, v|
      cmd << "#{k}) echo #{k}"
      cmd << "==$OPTARG" if v == ":"
      cmd << ";;\n"
    end
    cmd << "esac; done"
    output = `#{cmd}`
    return handle(output)
  end

  def handle(output)
    Hash.new.tap do |v|
      output.lines.each do |l|
        if l =~ /^(.)$/
          v[$1] = true
        elsif l =~ /^(.)==(.*)$/
          v[$1] = $2
        end
      end
    end
  end

  def to_getopts
    @args.map do |k, v|
      "#{k}#{v}"
    end.join("")
  end
end

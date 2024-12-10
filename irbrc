require 'irb/completion'
begin
  require 'irb/ext/save-history'
rescue LoadError
  # no-op
end

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

if Kernel.const_defined?("Rails")
  def show_logs
    Rails.logger = Logger.new($stdout)
  end
end

if defined?(Rails::Console)
  def show_mongo
    return false unless defined?(Moped)
    if Moped.logger == Rails.logger
      Moped.logger = Logger.new($stdout)
      true
    else
      Moped.logger = Rails.logger
      false
    end
  end
  alias show_moped show_mongo

  def show_active_record
    return false unless defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new($stdout)
    true
  end
  alias show_ar show_active_record
end

# Simulate HISTCONTROL=erasedups behavior from bash
# https://stackoverflow.com/a/47919632/8985
class EraseDupsInputMethod < IRB::ReadlineInputMethod
  def gets
    super.tap do # super adds line to HISTORY
      HISTORY.pop if HISTORY[-1] == HISTORY[-2]
    end
  end
end

# Method to pretty-print object methods
# Coded by sebastian delmont
# http://snippets.dzone.com/posts/show/2916
class Object
  ANSI_BOLD  = "\033[1m".freeze
  ANSI_RESET = "\033[0m".freeze
  ANSI_LGRAY = "\033[0;37m".freeze
  ANSI_GRAY  = "\033[1;30m".freeze

  # Print object's methods
  def pretty_methods(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select { |opt| opt.is_a? Regexp }.first
    methods = methods.select { |name| name =~ filter } if filter

    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity.zero?
        args = "()"
      elsif method.arity.positive?
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity.negative?
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect { |item| item[0].size }.max
    max_args = data.collect { |item| item[1].size }.max
    data.each do |item|
      print " #{ANSI_BOLD}#{item[0].to_s.rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end

  def local_readers(regex = nil)
    methods = local_methods.select do |name|
      arity = method(name).arity.zero?
      match = regex ? name =~ regex : true
      arity && match
    end
    methods.each do |name|
      print name.to_s.rjust(20)
      print " : "
      begin
        puts send(name).to_s.truncate(80)
      rescue StandardError => e
        puts e.message
      end
    end
    methods.size
  end
end

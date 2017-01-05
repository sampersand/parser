require_relative 'tokens/container'

class Locals
  attr_reader :functions
  attr_reader :knowns
  attr_reader :stack

  def initialize(knowns: nil, stack: nil)
    @knowns = knowns || {}
    @stack = stack || Container.new
    @functions = {}
  end

  def get(key); @knowns[key] end
  def set(key, value); @knowns[key] = value end
  
  def push(item)
    @stack.push(item)
  end
  def push_all(items)
    items.each(&method(:push))
  end
  def pop; @stack.pop end

  def clone_knowns
    self.class.new(knowns: @knowns.clone)
  end

  def execute
    @stack.call(locals: @knowns)
  end

  def to_s
    "#{self.class}(#{knowns}, #{stack})"
  end
  def pretty_print
    puts "--knowns--"
    puts knowns.to_s
    puts "--stack---"
    stack.each{ |s| puts s.to_s }
    puts "----------"
  end
end
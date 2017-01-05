require_relative 'tokens/container'

class Locals
  attr_reader :knowns
  attr_reader :stack

  def initialize(knowns: nil, stack: nil)
    @knowns = knowns || default_locals
    @stack = stack || Container.new
  end

  def default_locals
    {
      # :'$get' => Keyword.get
    }
  end

  def [](key)
    @knowns[key]
  end

  def []=(key, token)
    @knowns[key] = token
  end

  def <<(token)
    @stack << token
  end

  def pop
    @stack.pop
  end
  alias :pop_ult :pop

  def pop_penult
    @stack.delete_at(-2)
  end

  def clone_knowns
    self.class.new(knowns: @knowns.clone)
  end

  def to_s
    "#{self.class}(#{knowns}, #{stack})"
  end

  def update!(other)
    fail(other.class.to_s) unless other.is_a?(self.class)
    @knowns.update(other.knowns)
    @stack += other.stack
  end

end











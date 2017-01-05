require_relative 'tokens/container'

class Locals
  BUILT_INS = :'$builtins'

  attr_reader :knowns
  attr_reader :stack

  def initialize(knowns: nil, stack: nil)
    @knowns = knowns || default_knowns
    @stack = stack || Container.new
  end

  def user_knowns
    @knowns.reject{ |key| key == BUILT_INS }
  end

  def [](key)
    return @knowns[BUILT_INS] if key == BUILT_INS
    @knowns[key] || @knowns[BUILT_INS][key]
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

  def clone_knowns
    self.class.new(knowns: @knowns.clone)
  end

  def to_s
    "#{self.class}(#{knowns}, #{stack})"
  end

  def delete_at(pos)
    @stack.delete_at(pos)
  end

  def update!(other)
    fail(other.class.to_s) unless other.is_a?(self.class)
    @knowns.update(other.knowns)
    @stack += other.stack
  end

  def default_knowns #this might want to be added somewhere else...
    new_locals = {}
    new_locals[BUILT_INS] = { 
      :+    => proc { |locals:| locals.delete_at(-2) +  locals.pop                },
      :-    => proc { |locals:| locals.delete_at(-2) -  locals.pop                },
      :*    => proc { |locals:| locals.delete_at(-2) *  locals.pop                },
      :/    => proc { |locals:| locals.delete_at(-2) /  locals.pop                },
      :**   => proc { |locals:| locals.delete_at(-2) ** locals.pop                },
      :'='  => proc { |locals:| locals[locals.delete_at(-2)] = locals.pop; locals },
    }
    new_locals
  end

end












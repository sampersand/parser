require_relative 'token'

class Container < Token
  include Enumerable

  def initialize(value: nil)
    super(value: value || [])
  end

  def to_s
    "[#{@value.to_a.join(', ')}]"
  end

  def inspect_value
    @value.to_a.inspect
  end

  def [](pos)
    @value[pos]
  end

  def []=(pos, token)
    @value[pos] = token
  end

  def <<(pos)
    @value << pos
  end

  def pop
    @value.pop
  end

  def shift
    @value.shift
  end

  def unshift(value)
    @value.unshift(value)
  end

  def delete_at(num)
    @value.delete_at(num)
  end

  def each(&b)
    @value.each(&b)
  end

  def empty?
    @value.empty?
  end
  def clear
    @value.clear
  end

  def +(other)
    Container.new(value: @value + other.to_a)
  end

  def clone
    self.class.new(value: to_a)
  end

  def call(locals:, results:)

    locals = locals.clone_knowns(stack: self, transfer: false)
    results.update! locals.execute!
  end
end




















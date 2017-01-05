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
    @value + other.to_a
  end

end

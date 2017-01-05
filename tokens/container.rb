require_relative 'token'

class Container < Token

  def initialize(value: nil)
    super(value: value || [])
  end


  def to_s
    "[#{@value.to_a.join(', ')}]"
  end

  def inspect_value
    @value.to_a.inspect
  end

  alias :body :value

  
  def push(item)
    @value.push(item)
  end

  def pop
    @value.pop
  end

  def each(&block)
    @value.each(&block)
  end

end

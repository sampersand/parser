require_relative 'identifier'

class Number < Identifier
  DEFAULT_VALUE = 0
  ZERO = new
  def initialize(**k)
    super
    @value = @value.to_s.to_i
  end

  def +(other)
    self.class.new(value: value + other.value)
  end

  def -(other)
    self.class.new(value: value - other.value)
  end

  def *(other)
    self.class.new(value: value * other.value)
  end

  def /(other)
    self.class.new(value: value / other.value)
  end

  def **(other)
    self.class.new(value: value ** other.value)
  end

end
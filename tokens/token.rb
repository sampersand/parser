class Token
  DEFAULT_VALUE = nil

  attr_reader :value

  def initialize(value: self.class::DEFAULT_VALUE)
    @value = value
  end

  def ==(other)
    (self.class == other.class) && (value == other.value)
  end

  def inspect
    "#{self.class}( #{inspect_value} )"
  end

  def to_s
    @value.to_s
  end
  def inspect_value
    @value.inspect
  end

end

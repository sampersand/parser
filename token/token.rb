class Token
  attr_reader :value
  def initialize(value:)
    raise ArgumentError.new unless value.is_a?(Symbol)
    @value = value
  end

  def to_s
    @value.to_s
  end

  def inspect
    "#{self.class}( #{@value} )"
  end

  def ==(other)
    (self.class == other.class) && (value == other.value)
  end

  alias :== :eql?

  def hash
    @value.hash
  end

end
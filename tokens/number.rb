require_relative 'identifier'

class Number < Identifier
  DEFAULT_VALUE = 0
  def initialize(**k)
    super
    @value = Float(@value.to_s)
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

  def <=>(other)
    Identifier.new(value: case (value <=> other.value)
                          when -1 then :<
                          when 0 then :==
                          when 1 then :>
                          else :'?'
                          end)
  end
end
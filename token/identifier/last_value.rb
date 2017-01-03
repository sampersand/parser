require_relative 'identifier'
class Token::Identifier::LastValue < Token::Identifier
  VALUE = :'$'
  def initialize
    super(value: VALUE)
  end

  def to_instance(knowns:)
    stack[-1].to_instance(knowns: knowns)
  end

  def inspect
    "#{self.class.inspect}"
  end

  def eql?(other)
    self.class == other.class
  end

end
require_relative 'identifier'
class Token::Identifier::LastValue < Token::Identifier
  VALUE = :'$'
  def initialize
    super(value: VALUE)
  end

  def to_instance(knowns:)
    Instance::Identifier.new(token: knowns.get(token: self).value_at(knowns: knowns))
  end

  def inspect
    "#{self.class.inspect}"
  end

  def eql?(other)
    self.class == other.class
  end

end
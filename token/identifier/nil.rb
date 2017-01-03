require_relative 'identifier'
require 'instance/identifier/nil'

class Token::Identifier::Nil < Token::Identifier
  VALUE = :nil
  def initialize
    super(value: VALUE)
  end

  def to_instance(knowns:, stack:)
    Instance::Identifier::Nil.new(token: self)
  end

  def inspect
    "#{self.class.inspect}"
  end

  def eql?(other)
    self.class == other.class
  end

end
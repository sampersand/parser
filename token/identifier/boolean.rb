require_relative 'identifier'
require 'instance/identifier/boolean'

class Token::Identifier::Boolean < Token::Identifier

  def initialize(value:)
    raise ArgumentError.new(value) unless [:true, :false].include?(value)
    super
  end

  def to_instance(knowns:)
    Instance::Identifier::Boolean.new(value: @value)
  end

end
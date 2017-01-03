require_relative 'identifier'
require 'instance/identifier/boolean'

class Token::Identifier::Boolean < Token::Identifier

  def initialize(value:)
    raise ArgumentError.new(value) unless [:true, :false].include?(value)
    super
  end

  def to_instance(knowns:, stack:)
    Instance::Identifier::Boolean.new(token: self)
  end

end
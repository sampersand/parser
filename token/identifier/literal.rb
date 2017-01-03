require_relative 'identifier'
require 'instance/identifier/literal'

class Token::Identifier::Literal < Token::Identifier

  def to_instance(knowns:, stack:)
    Instance::Identifier::Literal.new(token: self)
  end

end
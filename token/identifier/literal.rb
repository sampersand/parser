require_relative 'identifier'
require 'instance/identifier/literal'

class Token::Identifier::Literal < Token::Identifier

  def to_instance(knowns:)
    Instance::Identifier::Literal.new(token: self)
  end

end
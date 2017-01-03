require 'token/token'
require 'instance/identifier/identifier'

class Token::Identifier < Token
  def to_instance(knowns:)
    Instance::Identifier.new(token: self)
  end
  def eql?(other)
    @value == other.value
  end
end
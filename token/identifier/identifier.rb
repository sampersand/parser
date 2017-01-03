require 'token/token'
require 'instance/identifier/identifier'

class Token::Identifier < Token

  def to_instance(knowns:, stack:)
    Instance::Identifier.new(token: self)
  end

  def eql?(other)
    @value == other.value
  end
end
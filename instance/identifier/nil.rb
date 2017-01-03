require_relative 'identifier'
class Instance::Identifier::Nil < Instance::Identifier

  def initialize(token: nil)
    super(token: token || Token::Identifier::Nil.new)
  end

  def value_at(knowns:)
    return knowns.get(token: @token).value_at(knowns: knowns) if knowns.include?(@token)
    nil
  end
end
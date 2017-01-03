require_relative 'identifier'
class Instance::Identifier::Nil < Instance::Identifier

  def initialize(value: nil)
    super(value: value || Token::Identifier::Nil.new)
  end

  def value_at(knowns:)
    nil
  end
end
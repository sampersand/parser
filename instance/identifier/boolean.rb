require_relative 'identifier'

class Instance::Identifier::Boolean < Instance::Identifier
  def value_at(knowns:)
    @token.value == :true
  end
end
require_relative 'identifier'
class Instance::Identifier::Literal < Instance::Identifier
  def value_at(knowns:)
    return knowns.get(token: @token).value_at(knowns: knowns) if knowns.include?(@token)
    @token.value.to_s
  end
end
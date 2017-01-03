require_relative 'binary'
class Token::Function::Operator::Binary::Attribute < Token::Function::Operator::Binary
  FUNCTION = ->(a, b, knowns:, stack:){
    raise unless b.respond_to?(:token)
    a.__get_attr__(attribute: b.token.value)
  }
  VALUE = :"."
end

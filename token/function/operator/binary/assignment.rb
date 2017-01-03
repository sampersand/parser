require_relative 'binary'
class Token::Function::Operator::Binary::Assignment < Token::Function::Operator::Binary
  FUNCTION = ->(a, b, knowns:){ knowns.set(value: a.value, instance: b) }
  VALUE = :"="
end

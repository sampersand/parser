require_relative 'binary'
class Token::Function::Operator::Binary::Assignment < Token::Function::Operator::Binary
  FUNCTION = ->(a, b, knowns:, stack:){ knowns.set(token: a.token, instance: b) }
  VALUE = :"="
end

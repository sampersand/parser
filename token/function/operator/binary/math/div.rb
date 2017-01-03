require_relative 'math'
class Token::Function::Operator::Binary::Math::Div < Token::Function::Operator::Binary::Math
  FUNCTION = ->(a, b, knowns:){ a.__div__(other: b, knowns: knowns) }
  VALUE = :/
end

require_relative 'math'
class Token::Function::Operator::Binary::Math::Pow < Token::Function::Operator::Binary::Math
  FUNCTION = ->(a, b, knowns:){ a.__pow__(other: b, knowns: knowns) }
  VALUE = :^
end

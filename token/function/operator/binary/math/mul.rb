require_relative 'math'
class Token::Function::Operator::Binary::Math::Mul < Token::Function::Operator::Binary::Math
  FUNCTION = ->(a, b, knowns:){ a.__mul__(other: b, knowns: knowns) }
  VALUE = :*
end

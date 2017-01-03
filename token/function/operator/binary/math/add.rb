require_relative 'math'
class Token::Function::Operator::Binary::Math::Add < Token::Function::Operator::Binary::Math
  FUNCTION = ->(a, b, knowns:, stack:){ a.__add__(other: b, knowns: knowns) }
  VALUE = :+
end

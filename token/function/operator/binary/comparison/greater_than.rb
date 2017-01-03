require_relative 'comparison'
class Token::Function::Operator::Binary::GreaterThan < Token::Function::Operator::Binary::Comparison
  FUNCTION = ->(a, b, knowns:){ a.__gt__(other: b, knowns: knowns) }
  VALUE = :>
end

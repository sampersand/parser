require_relative 'comparison'
class Token::Function::Operator::Binary::LessThanOrEqualTo < Token::Function::Operator::Binary::Comparison
  FUNCTION = ->(a, b, knowns:, stack:){ a.__lt_eql__(other: b, knowns: knowns) }
  VALUE = :<=
end

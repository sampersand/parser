require_relative 'comparison'
class Token::Function::Operator::Binary::GreaterThanOrEqualto < Token::Function::Operator::Binary::Comparison
  FUNCTION = ->(a, b, knowns:, stack:){ a.__gt_eql__(other: b, knowns: knowns) }
  VALUE = :>=
end

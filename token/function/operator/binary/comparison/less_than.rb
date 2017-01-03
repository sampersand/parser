require_relative 'comparison'
class Token::Function::Operator::Binary::LessThan < Token::Function::Operator::Binary::Comparison
  FUNCTION = ->(a, b, knowns:, stack:){ a.__lt__(other: b, knowns: knowns) }
  VALUE = :<
end

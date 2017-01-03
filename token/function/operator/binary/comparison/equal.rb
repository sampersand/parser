require_relative 'comparison'
class Token::Function::Operator::Binary::Equal < Token::Function::Operator::Binary::Comparison
  FUNCTION = ->(a, b, knowns:, stack:){ a.__eql__(other: b, knowns: knowns) }
  VALUE = :==
end

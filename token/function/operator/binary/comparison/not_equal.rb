require_relative 'comparison'
class Token::Function::Operator::Binary::NotEqual < Token::Function::Operator::Binary::Comparison
  FUNCTION = ->(a, b, knowns:){ a.__not_eql__(other: b, knowns: knowns) }
  VALUE = :"!="
end

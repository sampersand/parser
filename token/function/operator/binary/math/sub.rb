require_relative 'math'
class Token::Function::Operator::Binary::Math::Sub < Token::Function::Operator::Binary::Math
  FUNCTION = ->(a, b, knowns:){ a.__sub__(other: b, knowns: knowns) }
  VALUE = :-
end
require_relative 'logic'

class Token::Function::Keyword::Logic::And < Token::Function::Keyword::Logic
  VALUE = :and
  FUNC = ->(a, b, knowns:){ a.value_at(knowns: knowns) and b.value_at(knowns: knowns) }

end
require_relative 'logic'

class Token::Function::Keyword::Logic::Or < Token::Function::Keyword::Logic
  VALUE = :or
  FUNC = ->(a, b, knowns:){ a.value_at(knowns: knowns) or b.value_at(knowns: knowns) }

end
require_relative 'logic'

class Token::Function::Keyword::Logic::Or < Token::Function::Keyword::Logic
  VALUE = :or
  FUNC = ->(a, b, knowns:){ a or b }

end
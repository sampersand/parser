require_relative 'logic'

class Token::Function::Keyword::Logic::And < Token::Function::Keyword::Logic
  VALUE = :and
  FUNC = ->(a, b, knowns:){ a and b }

end
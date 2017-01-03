require_relative 'logic'

class Token::Function::Keyword::Logic::Xor < Token::Function::Keyword::Logic
  VALUE = :xor
  FUNC = ->(a, b, knowns:){ a ^ b }

end
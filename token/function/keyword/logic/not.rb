require_relative 'logic'

class Token::Function::Keyword::Logic::Not < Token::Function::Keyword::Logic
  VALUE = :"!"
  FUNC = ->(a, knowns:){ not a }

end
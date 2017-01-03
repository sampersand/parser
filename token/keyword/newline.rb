require_relative 'keyword'
class Token::Keyword::Newline < Token::Keyword
  VALUE = :';' #or \n ?
end
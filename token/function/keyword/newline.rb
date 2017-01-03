require_relative 'keyword'
class Token::Function::Keyword::Newline < Token::Function::Keyword
  VALUE = :';' #or \n ?
  FUNC = ->(last_eval, knowns:){
    Instance::Identifier::Nil.new(token: Token::Identifier::Nil.new)
  }
end
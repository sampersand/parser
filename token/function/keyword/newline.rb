require_relative 'keyword'
class Token::Function::Keyword::Newline < Token::Function::Keyword
  VALUE = :';' #or \n ?
  FUNC = ->(last_eval, knowns:, stack:){
    Instance::Identifier::Nil.new
  }
end
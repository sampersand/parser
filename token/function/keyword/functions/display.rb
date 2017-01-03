require_relative 'functions'
class Token::Function::Keyword::Functions::Display < Token::Function::Keyword::Functions
  VALUE = :display
  FUNC = ->(to_show, knowns:){
    puts to_show
    Instance::Identifier::Nil.new
  }
end

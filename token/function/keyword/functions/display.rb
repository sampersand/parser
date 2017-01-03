require_relative 'functions'
class Token::Function::Keyword::Functions::Display < Token::Function::Keyword::Functions
  VALUE = :display
  FUNC = ->(to_show, knowns:, stack:){
    disp(to_show.value_at(knowns: knowns))
    Instance::Identifier::Nil.new
  }
end

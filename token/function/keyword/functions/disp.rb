require_relative 'functions'
class Token::Function::Keyword::Functions::Disp < Token::Function::Keyword::Functions
  VALUE = :disp
  FUNC = ->(to_show, knowns:, stack:){
    puts(to_show.value_at(knowns: knowns))
    Token::Identifier::Nil.new.to_instance(knowns: knowns, stack: stack)
  }
end

require_relative 'control'
class Token::Function::Keyword::Control::If < Token::Function::Keyword::Control
  VALUE = :if
  FUNC = ->(cond, if_true, if_false, knowns:){
    cond ? if_true : if_false 
  }
end

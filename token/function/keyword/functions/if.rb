require_relative 'functions'
class Token::Function::Keyword::Functions::If < Token::Function::Keyword::Functions
  VALUE = :if
  FUNC = ->(cond, if_true, if_false, knowns:){cond.value_at(knowns: knowns) ? if_true : if_false }
end

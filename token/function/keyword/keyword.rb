require 'token/function/function'

class Token::Function::Keyword < Token::Function
  def initialize(**kwargs)
    kwargs[:value] ||= self.class::VALUE
    kwargs[:func] ||= self.class::FUNC
    super
  end
end
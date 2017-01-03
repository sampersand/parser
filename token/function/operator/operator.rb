require 'token/function/function'

class Token::Function::Operator < Token::Function
  def initialize(**kwargs)
    kwargs[:value] ||= self.class::VALUE
    kwargs[:func] ||= self.class::FUNCTION
    super(**kwargs)
  end

end
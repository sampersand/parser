require 'token/token'
class Token::Keyword < Token
  def initialize(**kwargs)
    kwargs[:value] ||= self.class::VALUE
    super(**kwargs)
  end
end

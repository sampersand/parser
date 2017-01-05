require_relative 'token'
class Keyword < Token  

  class LeftParen < Keyword
    DEFAULT_VALUE = :'('
  end

  class RightParen < Keyword
    DEFAULT_VALUE = :')'
  end

  class CallFunction < Keyword
    DEFAULT_VALUE = :call_function
  end

 class Get < CallFunction
    DEFAULT_VALUE = :get
  end

  class Newline < Keyword
    DEFAULT_VALUE = :";"
  end

end

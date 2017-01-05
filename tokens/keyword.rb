require_relative 'token'
class Keyword < Token  

  class Begin < Keyword
    DEFAULT_VALUE = :begin
  end

  class End < Keyword
    DEFAULT_VALUE = :end
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

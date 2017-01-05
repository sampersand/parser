require_relative 'token'
class Keyword < Token  
  LeftParen = Keyword.new(value: :'(')
  RightParen = Keyword.new(value: :')')
  CallFunction = Keyword.new(value: :call)
  Fetch = Keyword.new(value: :fetch)
  Newline = Keyword.new(value: :';')
  Default = Keyword.new(value: :_)
 #  class LeftParen < Keyword
 #    DEFAULT_VALUE = :'('
 #  end

 #  class RightParen < Keyword
 #    DEFAULT_VALUE = :')'
 #  end

 #  class CallFunction < Keyword
 #    DEFAULT_VALUE = :call_function
 #  end

 # class Fetch < CallFunction
 #    DEFAULT_VALUE = :fetch
 #  end

 #  class Newline < Keyword
 #    DEFAULT_VALUE = :";"
 #  end

 #  class Default < Keyword
 #    DEFAULT_VALUE = :_
 #  end

end

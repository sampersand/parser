require_relative 'function'
class Operator < Function
  def func
    proc do |locals:|
      func = locals[@value]
      raise NameError.new("No function named `#{@value}` found") unless func
      func.call(locals: locals)
    end
  end

  class Add < Operator; DEFAULT_VALUE = :+ end
  class Sub < Operator; DEFAULT_VALUE = :- end
  class Mul < Operator; DEFAULT_VALUE = :* end
  class Div < Operator; DEFAULT_VALUE = :/ end
  class Pow < Operator; DEFAULT_VALUE = :** end
  class Assign < Operator; DEFAULT_VALUE = :'=' end
end


















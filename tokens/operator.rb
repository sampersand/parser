require_relative 'function'
class Operator < Function
  def func
    ->(locals:){ locals.functions[value].call(locals: locals) }
  end
  class Add < Operator
    DEFAULT_VALUE = :+
  end
end
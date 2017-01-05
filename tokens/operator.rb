require_relative 'function'
class Operator < Function
  def initialize
    super(func: self.class::DEFAULT_FUNCTION, value: self.class::DEFAULT_VALUE)
  end
  
  Add = proc { |locals:| locals << locals.shift + locals.shift}
  Sub = proc { |locals:| locals << locals.shift - locals.shift}
  Mul = proc { |locals:| locals << locals.shift * locals.shift}
  Div = proc { |locals:| locals << locals.shift / locals.shift}
  Pow = proc { |locals:| locals << locals.shift ** locals.shift}
  Assign = proc { |locals:| locals[locals.shift] = locals.shift; locals }

end


















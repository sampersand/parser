require_relative 'function'
class Operator < Function
  def initialize
    super(func: self.class::DEFAULT_FUNCTION, value: self.class::DEFAULT_VALUE)
  end
  
  Add = proc { |locals:, result:| result << locals.stack[-2] +  locals.stack[-1] }
  Sub = proc { |locals:, result:| result << locals.stack[-2] -  locals.stack[-1] }
  Mul = proc { |locals:, result:| result << locals.stack[-2] *  locals.stack[-1] }
  Div = proc { |locals:, result:| result << locals.stack[-2] /  locals.stack[-1] }
  Pow = proc { |locals:, result:| result << locals.stack[-2] ** locals.stack[-1] }
  Assign = proc { |locals:, result:| result[locals.stack[-2]] = locals.stack[-1] }

end


















require_relative 'function'
class Operator < Function
  def initialize
    super(func: self.class::DEFAULT_FUNCTION, value: self.class::DEFAULT_VALUE)
  end
  
  Add = proc { |locals:| locals << (locals.pop_penult || Number.new) + locals.pop_ult }
  Sub = proc { |locals:| locals << (locals.pop_penult || Number.new) - locals.pop_ult }
  Mul = proc { |locals:| locals << locals.pop_penult * locals.pop_ult }
  Div = proc { |locals:| locals << locals.pop_penult / locals.pop_ult }
  Pow = proc { |locals:| locals << locals.pop_penult ** locals.pop_ult }
  Assign = proc { |locals:| locals[locals.pop_penult] = locals.pop_ult; locals }

end


















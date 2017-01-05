module Operator

  Add = proc { |locals:, results:| results << locals.stack[-2] +  locals.stack[-1] }
  Sub = proc { |locals:, results:| results << locals.stack[-2] -  locals.stack[-1] }
  Mul = proc { |locals:, results:| results << locals.stack[-2] *  locals.stack[-1] }
  Div = proc { |locals:, results:| results << locals.stack[-2] /  locals.stack[-1] }
  Pow = proc { |locals:, results:| results << locals.stack[-2] ** locals.stack[-1] }
  Assign = proc { |locals:, results:| results[locals.stack[-2]] = locals.stack[-1] }
  Compare = proc { |locals:, results:|
    results << (locals.stack[-2] <=> locals.stack[-1])
  }

end


















module Builtins
  
  Display = proc { |locals:, results:|
    puts locals.pop
  }

  Switch = proc{ |locals:, results:|
    cases = locals.pop
    switch_on = locals.pop
    cases_results = results.clone_knowns
    cases.call(locals: locals.clone_knowns, results: cases_results)
    chosen_case = cases_results[switch_on] || cases_results[ Keyword::Default ]
    results << chosen_case
  }
      # Identifier.new(value: :'$index') => proc { |locals:, results:|
      #   # puts locals.stack[-2].value
      #   p locals.stack[-2]
      #   results << locals.pop[locals.pop]
      # },
  While = proc { |locals:, results:|
    exit
    # puts locals.stack[-2].value
    body = locals.pop
    cond = locals.pop
    puts cond
    exit
  }
  RubyCode = proc{ |locals:, results:| 
    to_eval = locals.pop
    res = eval(to_eval.to_s, results.get_binding)
    results << (res.is_a?(Token) ? res : Identifier.new(value: res) )
  }

end

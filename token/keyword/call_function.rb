require_relative 'keyword'
class Token::Keyword::CallFunction < Token::Keyword
  VALUE = :call_function
  # FUNC = ->(name, args, knowns:){
  #   func = knowns[name.value]
  #   raise "Function `#{name}` not found!" unless func
  #   new_knowns = args.knowns_at(knowns: knowns.class.new)
  #   func.value_at(knowns: new_knowns)
  # }

end

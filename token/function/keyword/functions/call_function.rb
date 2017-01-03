require_relative 'functions'
class Token::Function::Keyword::Functions::CallFunction < Token::Function::Keyword::Functions
  VALUE = :call_function
  FUNC = ->(name, args, knowns:, stack:){
    func = knowns[name.token]
    raise "Function `#{name}` not found!" unless func
    new_knowns = args.knowns_at(knowns: knowns.class.new)
    func.value_at(knowns: new_knowns)
  }

end

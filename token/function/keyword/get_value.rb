require_relative 'keyword'
class Token::Function::Keyword::GetValue < Token::Function::Keyword
  VALUE = :get_value
  FUNC = ->(name, knowns:){
    raise "value `#{name}` not found!" unless knowns.include?(name.value)
    knowns[name.value]#.value_at(knowns: knowns)
  }

end

# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/number'

require 'pp'


body =  [
    Function.new(value: 2),
    Keyword::Begin.new,
      Number.new(value: 2),
      Number.new(value: 3),
    Keyword::End.new,
    Keyword::CallFunction.new,
]

locals = Parser::create_containers(body: body)
result = Parser::execute(locals: locals)
p result.user_knowns
p result.stack







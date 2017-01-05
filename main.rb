# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'

require 'pp'


body =  [
      Operator::Add.new,
      Keyword::Begin.new,
        Identifier.new(value: :'1'),
        Identifier.new(value: :'1'),
      Keyword::End.new,
      Keyword::CallFunction.new,
]

locals = Parser::create_containers(body: body)
result = Parser::execute(locals: locals)
result.pretty_print











# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/number'

require 'pp'


body =  [
    Identifier.new(value: :'='),
    Identifier.new(value: :+),
    Keyword::Begin.new,
      Number.new(value: 4),
      Number.new(value: 3),
    Keyword::End.new,
    Keyword::CallFunction.new,
    Identifier.new(value: :-),
    Keyword::Begin.new,
      Number.new(value: 5),
      Number.new(value: 3),
    Keyword::End.new,
    Keyword::CallFunction.new,


    # Identifier.new(value: :'$get'),
    # Keyword::Begin.new,
    #   Identifier.new(value: :'x'),
    # Keyword::End.new,
    # Keyword::CallFunction.new,

]

locals = Parser::create_containers(body: body)
locals[Identifier.new(value: :-) ] = Operator::Sub
locals[Identifier.new(value: :+) ] = Operator::Add
locals[Identifier.new(value: :*) ] = Operator::Mul
locals[Identifier.new(value: :'=')] = Operator::Assign

result = Parser::execute(locals: locals)


p result.stack
p result.pop







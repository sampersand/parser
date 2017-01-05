# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/number'

require 'pp'


def get(val)
  [
      Identifier.new(value: val),
      Keyword::Get.new,
  ]
end
body =  [

    *get(:'='),
    Keyword::Begin.new,
      Identifier.new(value: :foo),
      Keyword::Begin.new,

        *get(:**),
        Keyword::Begin.new,
          *get(:'x'),
          Number.new(value: :'4'),
        Keyword::End.new,
        Keyword::CallFunction.new,

      Keyword::End.new,
    Keyword::End.new,
    Keyword::CallFunction.new,

    *get(:'foo'),
    Keyword::Begin.new,

      *get(:'='),
      Keyword::Begin.new,
        Identifier.new(value: :x),
        Number.new(value: :'3'),
      Keyword::End.new,
      Keyword::CallFunction.new,

    Keyword::End.new,
    Keyword::CallFunction.new,


    # Identifier.new(value: :'='),
    # Keyword::Begin.new,
    #   Identifier.new(value: :'y'),
    #   Identifier.new(value: :'$get'),
    #   Keyword::Begin.new,
    #     Identifier.new(value: :'x'),
    #   Keyword::End.new,
    #   Keyword::CallFunction.new,
    # Keyword::End.new,
    # Keyword::CallFunction.new,

]

locals = Parser::create_containers(body: body)
locals[Identifier.new(value: :-) ] = Operator::Sub
locals[Identifier.new(value: :+) ] = Operator::Add
locals[Identifier.new(value: :/) ] = Operator::Div
locals[Identifier.new(value: :'=')] = Operator::Assign

result = locals.execute
puts locals
puts "knowns: #{result.token_knowns}"
puts "stack: #{result.stack}"
puts "last: #{result[-1]}"







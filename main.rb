$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require 'token/identifier/boolean'
require 'token/identifier/nil'


require 'token/keyword/newline'
require 'token/keyword/begin'
require 'token/keyword/end'
require 'token/keyword/call_function'

require 'token/function/keyword/control/if'
require 'token/function/keyword/functions/display'
require 'token/function/keyword/get_value'


require 'token/function/operator/binary/assignment'
require 'token/function/operator/binary/attribute'

require 'token/function/operator/binary/math/add'
require 'token/function/operator/binary/math/mul'
require 'token/function/operator/binary/math/pow'

require 'token/function/operator/binary/comparison/equal'
require 'token/function/operator/binary/comparison/greater_than'
require 'token/function/operator/binary/comparison/less_than'

require 'pp'


def identifier(value)
  Token::Identifier.new(value: value.to_s.to_sym)
end

def container(*args)
  [
    Token::Keyword::Begin.new,
    *args,
    Token::Keyword::End.new
  ]
end

def call(function, args)
  [
      *function,
      *container(*args),
    Token::Keyword::CallFunction.new
  ]
end

def set(id:, value:)
  call [Token::Function::Operator::Binary::Assignment.new], [identifier(id), value]
end
def get(id:) call [Token::Function::Keyword::GetValue.new], [identifier(id)] end
def add(left:, right:)
  call [Token::Function::Operator::Binary::Math::Add.new], [left, right]
end
def foo(x)
  x + 2
end
puts foo(4)

body =  [
    Token::Function::Operator::Binary::Assignment.new,
    Token::Keyword::Begin.new,
      Token::Identifier.new(value: :foo),
      *container(
        *call([Token::Function::Operator::Binary::Math::Add.new],
              [
                *get(id: :x) ,
                identifier(:'2'),
              ]),
        ),
    Token::Keyword::End.new,
  Token::Keyword::CallFunction.new,
  Token::Keyword::Newline.new,

    Token::Function::Keyword::Functions::Display.new,
    Token::Keyword::Begin.new,
        Token::Function::Keyword::GetValue.new,
        Token::Keyword::Begin.new,
          Token::Identifier.new(value: :foo),
        Token::Keyword::End.new,
      Token::Keyword::CallFunction.new,
      Token::Keyword::Begin.new,
          Token::Function::Operator::Binary::Assignment.new,
          Token::Keyword::Begin.new,
            Token::Identifier.new(value: :x),
            Token::Identifier.new(value: :'4'),
          Token::Keyword::End.new,
        Token::Keyword::CallFunction.new,
      Token::Keyword::End.new,
      Token::Keyword::CallFunction.new,
    Token::Keyword::End.new,
  Token::Keyword::CallFunction.new,

  # Token::Function::Operator::Binary::Assignment.new,
  #   Token::Keyword::Begin.new,
  #     Token::Identifier.new(value: :foo),
  #     Token::Keyword::Begin.new,
  #       Token::Function::Operator::Binary::Math::Add.new,
  #       Token::Keyword::Begin.new,
  #           Token::Function::Keyword::GetValue.new,
  #           Token::Keyword::Begin.new,
  #             Token::Identifier.new(value: :x),
  #           Token::Keyword::End.new,
  #         Token::Keyword::CallFunction.new,
  #         Token::Identifier.new(value: :'2'),
  #       Token::Keyword::End.new,
  #       Token::Keyword::CallFunction.new,
  #     Token::Keyword::End.new,
  #   Token::Keyword::End.new,
  # Token::Keyword::CallFunction.new,
  # Token::Keyword::Newline.new,

  #   Token::Function::Keyword::Functions::Display.new,
  #   Token::Keyword::Begin.new,
  #       Token::Function::Keyword::GetValue.new,
  #       Token::Keyword::Begin.new,
  #         Token::Identifier.new(value: :foo),
  #       Token::Keyword::End.new,
  #     Token::Keyword::CallFunction.new,
  #     Token::Keyword::Begin.new,
  #         Token::Function::Operator::Binary::Assignment.new,
  #         Token::Keyword::Begin.new,
  #           Token::Identifier.new(value: :x),
  #           Token::Identifier.new(value: :'4'),
  #         Token::Keyword::End.new,
  #       Token::Keyword::CallFunction.new,
  #     Token::Keyword::End.new,
  #     Token::Keyword::CallFunction.new,
  #   Token::Keyword::End.new,
  # Token::Keyword::CallFunction.new,

]
result = Parser::parse_rpn(token_iter: TokenIter.new(iterable: body))
new_knowns = Knowns.new
new_knowns.set(value: Token::Identifier.new(value: :x),
               instance: Instance::Identifier.new(value: :'9'))














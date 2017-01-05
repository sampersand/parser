# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/number'

require 'pp'


def num(val); Number.new(value: val) end
def id(val); Identifier.new(value: val) end

def get; Keyword::Get.new end
def l; Keyword::LeftParen.new end
def r; Keyword::RightParen.new end
def call; Keyword::CallFunction.new end

def set_simp(a, b) [id(:'='), get, l, a, b, r, call] end

body =  [
  :'$case',
  get,
  l,
    :false,
    l,
      :'=',
      get,
      l,
        :false,
        l,
          :'FALSE',  
        r,
      r,
      call,

      :'=',
      get,
      l,
        :true,
        l,
          :'$disp',
          get,
          l,
            :'here',
          r,
          call,
        r,
      r,
      call,
    r,
  r, 
  call,
  l,
  r,
  call,

].collect{ |e| e.is_a?(Symbol) ? id(e) : e }

locals = Parser::create_containers(body: body)
locals[Identifier.new(value: :-) ]  = Operator::Sub
locals[Identifier.new(value: :+) ]  = Operator::Add
locals[Identifier.new(value: :/) ]  = Operator::Div
locals[Identifier.new(value: :*) ]  = Operator::Mul
locals[Identifier.new(value: :**)]  = Operator::Pow
locals[Identifier.new(value: :'=')] = Operator::Assign

result = locals.execute!
puts '-------'
puts "locals: #{locals}"
puts "knowns: #{result.token_knowns}"
puts "stack: #{result.stack}"
puts "last: #{result[-1]}"







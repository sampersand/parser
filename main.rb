# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/builtins'
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
  :'=', get,
  l,
    :x,
    num(3),
  r, call,

  l,
    :'disp', get,
    l, :x, get, r, call,
    :'+', get,
    l,
      :x, get,
      num(2),
    r, call,
  r,
  l,
    :'=', get,
    l,
      :'x',
      :+, get,
      l,
        :'x', get,
        num(4),
      r, call,
    r, call,
  r, call,
  :'disp', get,
  l, :x, get,
  r, call,
].collect{ |e| e.is_a?(Symbol) ? id(e) : e }

# x = 1

# [disp!(x!)]()
# whilst = {
#   switch( cmp(x, 10) ){
#     :<  => { whilst( x = x + 1) }
#     :== => {}
#   }
# }

locals = Parser::create_containers(body: body)
locals.globals[Identifier.new(value: :-)  ] = Operator::Sub
locals.globals[Identifier.new(value: :+)  ] = Operator::Add
locals.globals[Identifier.new(value: :/)  ] = Operator::Div
locals.globals[Identifier.new(value: :*)  ] = Operator::Mul
locals.globals[Identifier.new(value: :**) ] = Operator::Pow
locals.globals[Identifier.new(value: :'=')] = Operator::Assign
locals.globals[Identifier.new(value: :'cmp')] = Operator::Compare

locals.globals[Identifier.new(value: :disp)]   = Builtins::Display
locals.globals[Identifier.new(value: :switch)] = Builtins::Switch
locals.globals[Identifier.new(value: :rb)]    = Builtins::RubyCode
results = locals.execute!
puts '-------'
# puts "locals: #{locals}\n\n"
puts "results: #{results}"







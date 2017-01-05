# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/builtins'
require_relative 'tokens/number'

require 'pp'


def num(val) Number.new(value: val) end
def id(val) Identifier.new(value: val) end

def fetch; Keyword::Fetch end
def get(id) [id, fetch] end
def l; Keyword::LeftParen end
def r; Keyword::RightParen end
def call; Keyword::CallFunction end
def default; Keyword::Default end

def arr(*body)
  [l, *body, r]
end

def run_id(id, *args)
  [
    *get(id),
    *arr(
      *args,
    ), call
  ]
end
def set(id, *value)
  run_id(:'=', id, *value)
end


body =  [
  *set(:whilst,
    *arr(
      *run_id(:switch,
        *run_id(:cmp, *get(:x), num(10)),
        *arr(
          *set(:<, *arr(
            *run_id( :disp, *get(:x) ),
            *run_id(:whilst, *set(:x, *run_id(:+, *get(:x), num(1)))))),
          *set(default, *arr),
        )
      ),
      *arr(:y,), call,
    )),

  *run_id(:whilst,  *set(:x, num(0)))
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







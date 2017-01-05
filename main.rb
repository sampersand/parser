# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require_relative 'parser'
require_relative 'tokens/operator'
require_relative 'tokens/builtins'
require_relative 'tokens/number'

require 'pp'



FETCH = Keyword::Fetch
LEFT = Keyword::LeftParen
RIGHT = Keyword::RightParen
CALL = Keyword::CallFunction
DEFAULT = Keyword::Default
NEWLINE = Keyword::Newline
RETURN = Keyword::Return

def num(val) Number.new(value: val) end
def id(val) Identifier.new(value: val) end
def get(id) [id, FETCH] end
def arr(*body) [LEFT, *body, RIGHT] end
def run_id(id, *args)
  [
    *get(id),
    *arr(
      *args,
    ), CALL
  ]
end
def set(id, *value)
  run_id(:'=', id, *value)
end

body =  [
  *set(:foo, *arr(
      *run_id(:switch,
        *run_id(:cmp, *get(:x), num(10)),
        *arr(
          *set(:<, *arr(num(10), RETURN)),
        )),
      *arr, CALL,
      1
  )),
  *run_id(:foo, *set(:x, num(5)))
  # *set(:whilst,
  #   *arr(
  #     *run_id(:switch,
  #       *run_id(:cmp, *get(:x), num(10)),
  #       *arr(
  #         *set(:<, *arr(
  #           *run_id( :disp, *get(:x) ),
  #           *run_id(:whilst, *set(:x, *run_id(:+, *get(:x), num(1)))),
  #           # NEWLINE,
  #           )),
  #         *set(DEFAULT, *arr),
  #       )
  #     ),
  #     *arr, CALL,
  #     *get(:x),
  #   )),

  # *run_id(:whilst,  *set(:x, num(0)))
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
locals.globals[Identifier.new(value: :+)  ] = Operator::Add
# locals.globals[Identifier.new(value: :-)  ] = Operator::Sub
# locals.globals[Identifier.new(value: :*)  ] = Operator::Mul
# locals.globals[Identifier.new(value: :/)  ] = Operator::Div
locals.globals[Identifier.new(value: :**) ] = Operator::Pow
locals.globals[Identifier.new(value: :'=')] = Operator::Assign
locals.globals[Identifier.new(value: :'cmp')] = Operator::Compare

locals.globals[Identifier.new(value: :print_locals)] = proc { |locals:, results:| 
  # puts results
}
locals.globals[Identifier.new(value: :disp)]   = Builtins::Display
locals.globals[Identifier.new(value: :switch)] = Builtins::Switch
# locals.globals[Identifier.new(value: :rb)]    = Builtins::RubyCode
results = locals.execute!
puts '-------'
# puts "locals: #{locals}\n\n"
puts "results: #{results}"






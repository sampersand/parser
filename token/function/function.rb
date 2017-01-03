require 'token/token'
class Token::Function < Token
  attr_reader :arity

  def initialize(func:, arity: nil, **kwargs)
    super(**kwargs)
    @func = func
    raise ArgumentError.new("func needs to respond to :call") unless @func.respond_to?(:call)
    @arity = arity || @func.arity #which will break if it's -1
    @arity -= 1 # compensates for the 'knowns:' and 'stack:'
    raise "No negative arity yet" if @arity < 0
  end

  def execute(args:, knowns:, stack:)
    @func.call(*args, knowns: knowns, stack: stack)
  end
end
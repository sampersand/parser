require 'token/token'
require 'instance/function'
class Token::Function < Token

  def initialize(func:, **kwargs)
    super(**kwargs)
    @func = func
    raise ArgumentError.new("func needs to respond to :call") unless @func.respond_to?(:call)
  end

  def execute(args:, knowns:)
    args = args.token_iter.clone_to_a
    @func.call(*args, knowns: knowns)
  end

  def to_instance(knowns:)
    Instance::Function.new(func: @func)
  end
end
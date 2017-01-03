require 'token/token'
require 'instance/function'
class Token::Function < Token

  def initialize(func:, **kwargs)
    super(**kwargs)
    @func = func
    raise ArgumentError.new("func needs to respond to :call") unless @func.respond_to?(:call)
  end

  def execute(args:, knowns:, stack:)
    args = args.value_at(knowns: knowns).token_iter.clone_to_a
    @func.call(*args, knowns: knowns, stack: stack)
  end

  def to_instance(knowns:, stack:)
    Instance::Function.new(token: self)
  end
end
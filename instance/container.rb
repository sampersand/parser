require_relative 'instance'
class Instance::Container < Instance

  include Enumerable
  

  attr_reader :token_iter

  def initialize(token_iter:)
    @token_iter = token_iter
  end

  def each(&block)
    @token_iter.each(&block)
  end

  def to_s
    @token_iter.to_s
  end

  def inspect
    "#{self.class}( <body> )"
  end

  def value_at(knowns:)
    Instance::Container.new(token_iter: TokenIter.new(iterable: stack_at(knowns: knowns)))
  end

  def execute(args:, knowns:)
    new_knowns = args.knowns_at(knowns: knowns.clone).delete_if{ |key| knowns.include?(key) }
    value_at(knowns: new_knowns)
  end

  def execute_at(knowns:)
    Parser::parse_rpn(token_iter: @token_iter, knowns: knowns.clone)
  end

  def stack_at(knowns:)
    execute_at(knowns: knowns)[:stack]
  end

  def knowns_at(knowns:)
    execute_at(knowns: knowns)[:knowns]
  end

  def length(slf)
    Instance::Identifier.new(value: count)
  end
end




















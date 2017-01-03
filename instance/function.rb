require_relative 'instance'
class Instance::Function < Instance
  attr_reader :func

  def initialize(func:)
    @func = func
  end

  def to_s
    @func.to_s
  end


  def inspect
    "#{self.class}( <func> )"
  end


  def execute(args:, knowns:)  
    @func.call(*args.token_iter.clone_to_a, knowns: knowns)
  end

end




















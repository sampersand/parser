require_relative 'instance'
class Instance::Function < Instance
  attr_reader :token

  def initialize(token:)
    @token = token
  end

  def to_s
    @token.to_s
  end


  def execute(args:, knowns:, stack:)
    @token.execute(args: args, knowns: knowns, stack: stack)
  end

end




















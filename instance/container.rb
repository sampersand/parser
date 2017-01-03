require_relative 'instance'
class Instance::Container < Instance

  attr_reader :token_iter

  def initialize(token_iter:)
    @token_iter = token_iter
  end

  def to_s
    '<container>'
  end

  def inspect
    "#{self.class}( <body> )"
  end

  def value_at(knowns:)
    result = Parser::parse_rpn(token_iter: @token_iter, knowns: knowns.clone)
    result[:stack].collect{ |t| t.value_at(knowns: knowns.clone) }
  end
end
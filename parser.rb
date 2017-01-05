# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
module Parser
  require_relative 'locals'
  require_relative 'tokens/keyword'
  require_relative 'tokens/identifier'
  require_relative 'tokens/function'
  require_relative 'tokens/container'

  module_function
  def find_end(body_iter)
    arr = []
    until (arr << body_iter.next)[-1].is_a?(Keyword::End)
      if arr[-1].is_a?(Keyword::Begin)
        arr.pop #remove the begin
        arr << find_end(body_iter)
      end
    end
    fail unless arr.pop.is_a?(Keyword::End)
    Container.new(value: arr)
  end

  def create_containers(body:)
    locals = Locals.new
    body_iter = body.each
    loop do
      token = body_iter.next
      case token
      when Keyword::Begin
        locals << find_end(body_iter)
      else
        locals << token
      end
    end
    locals
  end



end






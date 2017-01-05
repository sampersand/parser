# $LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
module Parser
  require_relative 'locals'
  require_relative 'tokens/keyword'
  require_relative 'tokens/identifier'
  require_relative 'tokens/function'
  require_relative 'tokens/container'

  module_function
  def find_end(body_iter:)
    arr = []
    until (arr << body_iter.next)[-1].is_a?(Keyword::End)
      if arr[-1].is_a?(Keyword::Begin)
        arr.pop #remove the beign
        arr << find_end(body_iter: body_iter)
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
        locals.push(find_end(body_iter: body_iter))
      else
        locals.push(token)
      end
    end
    locals
  end

  def execute(locals:)
    result = locals.class.new
    locals.stack.each do |token|
      case token
      when Keyword
        case token
        when Keyword::Newline
          locals.pop
        when Keyword::CallFunction
          args = locals.pop
          function = locals.pop
          new_locals = locals.clone_knowns
          new_locals.push_all(args)
          result_value = function.call(locals: new_locals)
          result_value ||= Identifier::Nil.new
          result.push(result_value)
        else fail token
        end
      else
        result.push(token)
      end
    end
    result
  end
end










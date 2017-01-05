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
        locals << find_end(body_iter)
      else
        locals << token
      end
    end
    locals
  end

  def execute!(locals:)

    result = locals.class.new
    until locals.stack.empty?
      token = locals.stack.pop
      puts "new token: #{token}, #{result.stack}, #{locals.stack}"
      case token
      when Keyword
        case token
        when Keyword::Newline
          locals.pop
        when Keyword::CallFunction
          p locals.stack
          args = locals.pop
          func_name = locals.pop
          function = locals[func_name]

          raise "Unknown function `#{func_name.inspect}`" unless function
          
          new_locals = locals.clone_knowns
          args.each(&new_locals.method(:<<))

          function.call(locals: new_locals) || Identifier::Nil.new 
          result.update! new_locals

        else
          fail token
        end
      else
        result.stack.unshift(token)
      end
    end
    result
  end
  def execute(locals: )
    execute!(locals: locals.clone)
  end

end






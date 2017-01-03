$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
module Parser
  require 'instance/instance'
  require 'instance/container'
  require 'token/token'
  require 'token/identifier/identifier'
  require 'token/function/function'
  require 'token/keyword/call_function'
  require 'knowns'
  require 'token_iter'
  require 'stack'

  ArgumentError = Class.new(ArgumentError)

  module_function
  def find_end(token_iter:)
    arr = []
    begans_found = 1
    until begans_found <= 0
      token = token_iter.next
      if token.is_a?(Token::Keyword::Begin)
        begans_found += 1
      elsif token.is_a?(Token::Keyword::End)
        begans_found -= 1
      end
      arr << token
    end
    arr.pop #last one will be the extra end
    Instance::Container.new(token_iter: TokenIter.new(iterable: arr.each))
  end

  def parse_rpn(token_iter:, knowns: nil)
    knowns ||= Knowns.new
    stack  = Stack.new
    loop {
      token = token_iter.next
      case token
      when Token::Keyword::Begin
        stack.push(instance: find_end(token_iter: token_iter))
      when Token::Keyword::Newline
        stack.pop
      when Token::Keyword::CallFunction
        args = stack.pop
        function = stack.pop

        args = args.value_at(knowns: knowns) unless function.is_a?(Instance::Container)
        #change around all other functions to use args.value_at
        result_value = function.execute(args: args, knowns: knowns)
        result_value ||= Instance::Identifier::Nil.new
        stack.push(instance: result_value)
      when Token::Identifier, Token::Function
        stack.push(instance: token.to_instance(knowns: knowns))

      # when Token::Function
      #   args = stack.pop(amnt: token.arity)
      #   if args.length != token.arity
      #     if token.is_a?(Token::Function::Keyword::Newline)
      #       args = [nil]
      #     else
      #       raise ArgumentError.new("token `#{token}` got invalid args: #{args}")
      #     end
      #   end
      #   res = token.execute(args: args, knowns: knowns, stack: stack)
      #   stack.push(instance: res)
      #   # stack.push(instance: token.execute(args: args, knowns: knowns, stack: stack))
      else
        raise "Cannot deal with token: #{token.inspect}"
      end
    }
    {knowns: knowns, stack: stack}
  end
end

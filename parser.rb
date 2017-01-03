$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))
module Parser
  require 'instance/instance'
  require 'instance/container'
  require 'token/token'
  require 'token/identifier/identifier'
  require 'token/identifier/last_value'
  require 'token/function/function'
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
      if token.is_a?(Token::Keyword::Block::Begin)
        begans_found += 1
      elsif token.is_a?(Token::Keyword::Block::End)
        begans_found -= 1
      end
      arr << token
    end
    arr.pop #last one will be the extra end
    Instance::Container.new(token_iter: TokenIter.new(iterable: arr.each))
  end

  def parse_rpn(token_iter:, knowns: nil, stack: nil)
    knowns ||= Knowns.new
    stack  ||= Stack.new
    loop {
      token = token_iter.next
      case token
      when Token::Function::Keyword::Functions::CallFunction
        args = stack.pop
        function = stack.pop
        stack.push(instance: function.execute(args: args, knowns: knowns, stack: stack))
      when Token::Identifier, Token::Function
        stack.push(instance: token.to_instance(stack: stack, knowns: knowns))
      when Token::Keyword::Block::Begin
        stack.push(instance: find_end(token_iter: token_iter))

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

if __FILE__ == $0

  
  require 'token/identifier/literal'
  require 'token/identifier/boolean'
  require 'token/identifier/nil'

  require 'token/function/keyword/newline'

  require 'token/keyword/block/begin'
  require 'token/keyword/block/end'
  
  require 'token/function/keyword/functions/if'
  require 'token/function/keyword/functions/display'
  require 'token/function/keyword/functions/call_function'


  require 'token/function/operator/binary/assignment'
  require 'token/function/operator/binary/attribute'

  require 'token/function/operator/binary/math/add'
  require 'token/function/operator/binary/math/mul'
  require 'token/function/operator/binary/math/pow'
  
  require 'token/function/operator/binary/comparison/equal'
  require 'token/function/operator/binary/comparison/greater_than'
  require 'token/function/operator/binary/comparison/less_than'
  
  require 'pp'

  body =  [
    Token::Function::Operator::Binary::Math::Add.new,
    Token::Keyword::Block::Begin.new,
      Token::Identifier.new(value: :'4'),
      Token::Identifier.new(value: :'2'),
    Token::Keyword::Block::End.new,
    Token::Function::Keyword::Functions::CallFunction.new,
    # Token::Identifier.new(value: :'x'),
    # Token::Function::Keyword::Functions::Display.new,
    

    # Token::Identifier.new(value: :'array'),
    # Token::Keyword::Block::Begin.new,
    #     Token::Identifier.new(value: :'2'),
    #     Token::Identifier.new(value: :'4'),
    #     Token::Identifier.new(value: :'6'),
    # Token::Keyword::Block::End.new,
    # Token::Function::Operator::Binary::Assignment.new,

    # Token::Identifier.new(value: :'length'),
    # Token::Function::Operator::Binary::Attribute.new,
    # Token::Keyword::Block::Begin.new,
    # Token::Keyword::Block::End.new,
    # Token::Function::Keyword::Functions::CallFunction.new,

    
    # Token::Identifier.new(value: :'func'),
    # Token::Keyword::Block::Begin.new,
    #   Token::Identifier.new(value: :'x'),
    #   Token::Identifier.new(value: :'4'),
    #   Token::Function::Operator::Binary::Math::Pow.new,
    #   Token::Keyword::Block::Begin.new,
    #     Token::Identifier.new(value: :'y'),
    #   Token::Keyword::Block::End.new,
    # Token::Keyword::Block::End.new,
    # Token::Function::Keyword::Newline.new,

    
    # Token::Identifier.new(value: :'func'),
    # Token::Keyword::Block::Begin.new,
    #   Token::Identifier.new(value: :'x'),
    #   Token::Identifier.new(value: :'3'),
    #   Token::Function::Operator::Binary::Assignment.new,
    # Token::Keyword::Block::End.new,
    # Token::Function::Keyword::Functions::CallFunction.new
    
  ]
  result = Parser::parse_rpn(token_iter: TokenIter.new(iterable: body))
  new_knowns = Knowns.new
  new_knowns.set(token: Token::Identifier.new(value: :x),
                 instance: Instance::Identifier.new(token: Token::Identifier.new(value: :'9')))
  puts result[:stack].to_s
end







require_relative 'tokens/container'

class Locals
  attr_reader :knowns
  attr_reader :stack

  def initialize(knowns: nil, stack: nil)
    @knowns = knowns || default_locals
    @stack = stack || Container.new
  end

  def default_locals
    {
      Identifier.new(value: :'$disp') => proc { |locals:, result:|
        p locals.pop
      },
      Identifier.new(value: :'$index') => proc { |locals:, result:|
        # puts locals.stack[-2].value
        p locals.stack[-2]
        result << locals.pop[locals.pop]
      },
      Identifier.new(value: :'$case') => proc { |locals:, result:|
        cases = result.class.new
        locals.pop.call(locals: result.clone_knowns, result: cases)
        chosen_case = cases[locals.pop]
        puts "chosen case: #{chosen_case.inspect}"
        result << chosen_case
      }
    }
  end
#hi from dad
  def [](key)
    @knowns[key]
  end

  def []=(key, token)
    @knowns[key] = token
  end

  def <<(token)
    @stack << token
  end

  def shift
    @stack.shift
  end

  def pop
    @stack.pop
  end

  def delete_at(pos)
    @stack.delete_at(pos)
  end


  def clone_knowns(stack: nil)
    self.class.new(knowns: @knowns, stack: stack.nil? ? nil : stack)
  end

  def token_knowns
    @knowns.select{ |_, value| value.is_a?(Token) }
  end

  def to_s
    "#{self.class}({#{token_knowns.collect{ |k, v| "#{k}: #{v}"}.join(', ') }}, #{stack})"
  end

  def update!(other)
    fail(other.class.to_s) unless other.is_a?(self.class)
    @knowns.update(other.knowns)
    @stack += other.stack
  end

  def execute!
    result = clone_knowns
    until stack.empty?
      token = shift
      case token
      when Keyword
        case token
        when Keyword::Newline
          pop

        when Keyword::Get
          to_get = result.pop
          to_add = result[to_get]
          raise "Unknown local: #{to_get}" unless to_add
          result << to_add

        when Keyword::CallFunction
          args = result.pop
          func = result.pop

          new_locals = result.clone_knowns(stack: args)
          new_locals = new_locals.execute!
          func.call(locals: new_locals, result: result)
        else
          fail token
        end
      else
        result.stack << token
      end
    end
    result
  end

end


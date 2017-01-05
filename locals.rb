class Object
  def deep_clone
    return @deep_cloning_obj if @deep_cloning
    @deep_cloning_obj = clone
    @deep_cloning_obj.instance_variables.each do |var|
      val = @deep_cloning_obj.instance_variable_get(var)
      begin
        @deep_cloning = true
        val = val.deep_clone
      rescue TypeError
        next
      ensure
        @deep_cloning = false
      end
      @deep_cloning_obj.instance_variable_set(var, val)
    end
    deep_cloning_obj = @deep_cloning_obj
    @deep_cloning_obj = nil
    deep_cloning_obj
  end
end

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
      # Identifier.new(value: :'$get') => proc { |locals:, result:| result << locals[locals.pop] }
    }
  end

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
    self.class.new(knowns: @knowns.deep_clone, stack: stack.nil? ? nil : stack.deep_clone)
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
          result << result[to_get]

        when Keyword::CallFunction

          args = result.pop
          func = .pop

          new_locals = result.clone_knowns(stack: args)
          new_locals = new_locals.execute!
          puts "args: #{args}, result: #{result}"
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

  def execute
    deep_clone.execute!
  end

end


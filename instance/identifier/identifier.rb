require 'instance/instance'

class Instance::Identifier < Instance


  attr_reader :token

  def initialize(token:)
    @token = token
  end

  def to_s
    @token.to_s
  end

  def inspect
    "#{self.class}( #{@token.to_s} )"
  end


  def __add__(other:, knowns:)
    Instance::Identifier.new(token:\
        Token::Identifier.new(value: exec_func(func: :+,  other: other, knowns: knowns).to_s.to_sym))
  end

  def __sub__(other:, knowns:)
    Instance::Identifier.new(token:\
        Token::Identifier.new(value: exec_func(func: :-,  other: other, knowns: knowns).to_s.to_sym))
  end

  def __mul__(other:, knowns:)
    Instance::Identifier.new(token:\
        Token::Identifier.new(value: exec_func(func: :*,  other: other, knowns: knowns).to_s.to_sym))
  end

  def __div__(other:, knowns:)
    Instance::Identifier.new(token:\
        Token::Identifier.new(value: exec_func(func: :/,  other: other, knowns: knowns).to_s.to_sym))
  end

  def __pow__(other:, knowns:)
    Instance::Identifier.new(token:\
        Token::Identifier.new(value: exec_func(func: :**, other: other, knowns: knowns).to_s.to_sym))
  end



  def __eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(token:\
        Token::Identifier::Boolean.new(value: exec_func(func: :==,
                                                        other: other,
                                                        knowns: knowns).to_s.to_sym))
  end

  def __not_eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(token:\
        Token::Identifier::Boolean.new(value: exec_func(func: :'!=',
                                                        other: other,
                                                        knowns: knowns).to_s.to_sym))
  end

  def __lt__(other:, knowns:)
    Instance::Identifier::Boolean.new(token:\
        Token::Identifier::Boolean.new(value: exec_func(func: :<,
                                                        other: other,
                                                        knowns: knowns).to_s.to_sym))
  end

  def __lt_eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(token:\
        Token::Identifier::Boolean.new(value: exec_func(func: :<=,
                                                        other: other,
                                                        knowns: knowns).to_s.to_sym))
  end

  def __gt__(other:, knowns:)
    Instance::Identifier::Boolean.new(token:\
        Token::Identifier::Boolean.new(value: exec_func(func: :>,
                                                        other: other,
                                                        knowns: knowns).to_s.to_sym))
  end

  def __gt_eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(token:
        Token::Identifier::Boolean.new(value: exec_func(func: :>=,
                                                        other: other,
                                                        knowns: knowns).to_s.to_sym))
  end




  def exec_func(func:, other:, knowns:)
    self_value = value_at(knowns: knowns)
    other_value = other.value_at(knowns: knowns)
    self_value.method(func).call(other_value)
  end

  def value_at(knowns:)
    return knowns.get(token: @token).value_at(knowns: knowns) if knowns.include?(@token)
    begin
      Float(@token.value.to_s) # this is hacky
    rescue Exception => e
      @token.value.to_s
    end
  end

end






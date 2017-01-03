require 'instance/instance'

class Instance::Identifier < Instance


  attr_reader :value

  def initialize(value:)
    @value = value
  end

  def to_s
    @value.to_s
  end

  def inspect
    "#{self.class}( #{@value.to_s} )"
  end


  def __add__(other:, knowns:)
    Instance::Identifier.new(value: exec_func(func: :+,
                                              other: other,
                                              knowns: knowns))
  end

  def __sub__(other:, knowns:)
    Instance::Identifier.new(value: exec_func(func: :-,
                                              other: other,
                                              knowns: knowns))
  end

  def __mul__(other:, knowns:)
    Instance::Identifier.new(value: exec_func(func: :*,
                                              other: other,
                                              knowns: knowns))
  end

  def __div__(other:, knowns:)
    Instance::Identifier.new(value: exec_func(func: :/,
                                              other: other,
                                              knowns: knowns))
  end

  def __pow__(other:, knowns:)
    Instance::Identifier.new(value: exec_func(func: :**,
                                              other: other,
                                              knowns: knowns))
  end



  def __eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(value: exec_func(func: :==,
                                                       other: other,
                                                       knowns: knowns))
  end

  def __not_eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(value: exec_func(func: :'!=',
                                                       other: other,
                                                       knowns: knowns))
  end

  def __lt__(other:, knowns:)
    Instance::Identifier::Boolean.new(value: exec_func(func: :<,
                                                       other: other,
                                                       knowns: knowns))
  end

  def __lt_eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(value: exec_func(func: :<=,
                                                       other: other,
                                                       knowns: knowns))
  end

  def __gt__(other:, knowns:)
    Instance::Identifier::Boolean.new(value: exec_func(func: :>,
                                                       other: other,
                                                       knowns: knowns))
  end

  def __gt_eql__(other:, knowns:)
    Instance::Identifier::Boolean.new(value exec_func(func: :>=,
                                                      other: other,
                                                      knowns: knowns))
  end




  def exec_func(func:, other:, knowns:)
    self_value = value_at(knowns: knowns) #do this?
    other_value = other.value_at(knowns: knowns) #do this?
    self_value.method(func).call(other_value)
  end

  def value_at(knowns:)
    begin
      Float(@value.to_s) # this is hacky
    rescue Exception => e
      @value.to_s
    end
  end

end








class Knowns < Hash
  LAST_VALUE = Token::Identifier::LastValue.new

  def push(instance:)
    raise(instance.inspect) unless instance.is_a?(Instance)
    self[LAST_VALUE] = instance
  end

  def set(token:, instance:)
    self[token] = instance
    self
  end

  def get(token:)
    self[token]
  end

  def last_value
    self[LAST_VALUE]
  end

end
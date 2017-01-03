class Knowns < Hash

  def set(token:, instance:)
    self[token] = instance
  end

  def get(token:)
    self[token]
  end

end
class Knowns < Hash

  def set(value:, instance:)
    self[value] = instance
  end

  def get(value:)
    self[value]
  end

end
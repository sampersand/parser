class Stack < Array

  def push(instance:)
    raise unless instance.is_a?(Instance)
    super(instance)
  end

  def pop(amnt: nil)
    amnt ? super(amnt) : super()
  end

end
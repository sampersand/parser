class Stack < Array
  def initialize(knowns:)
    super([])
    @knowns = knowns
    raise ArgumentError.new(knowns.class) unless knowns.is_a?(Hash)
  end

  def push(instance:, add_to_knowns: true)
    raise unless instance.is_a?(Instance)
    @knowns.push(instance: instance) if add_to_knowns
    super(instance)
  end

  def pop(amnt: nil)
    amnt ? super(amnt) : super()
  end

end
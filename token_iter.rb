class TokenIter
  def initialize(iterable:)
    @iterable = iterable.each
  end
  def next
    @iterable.next
  end
  def to_s
    "[#{clone_to_a.join(', ')}]"
  end
  def clone_to_a
    @iterable.clone.to_a
  end
  
end
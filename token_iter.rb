class TokenIter
  def initialize(iterable:)
    @iterable = iterable
  end
  def next
    @iterable.next
  end
  def to_s
    @iterable.to_s
  end
end
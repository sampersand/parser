require_relative 'token'

class Identifier < Token
  DEFAULT_VALUE = :no_name

  # class Nil < Identifier
  #   DEFAULT_VALUE = :nil
  # end

  def +(other)
    self.class.new(value: @value.to_s + other.value.to_s)
  end
end

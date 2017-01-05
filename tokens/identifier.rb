require_relative 'token'

class Identifier < Token
  DEFAULT_VALUE = :no_name

  class Nil < Identifier
    DEFAULT_VALUE = :nil
  end

end

require_relative 'logic'

class Token::Function::Keyword::Logic::Xor < Token::Function::Keyword::Logic
  VALUE = :xor
  FUNC = ->(a, b, knowns:, stack:){ a.value_at(knowns: knowns) ^ b.value_at(knowns: knowns) }

end
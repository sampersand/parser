require_relative 'block'
class Token::Keyword::Block::End < Token::Keyword::Block
  VALUE = :end
end


# begin
# x
# 5
# +
# end
# begin
# x
# end
# foo
# to_function
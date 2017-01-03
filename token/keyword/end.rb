require_relative 'keyword'
class Token::Keyword::End < Token::Keyword
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
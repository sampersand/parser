require_relative 'binary'
class Token::Function::Operator::Binary::Attribute < Token::Function::Operator::Binary
  FUNCTION = ->(a, b, knowns:){
    raise "b (#{b.class}) needs to respond to :value" unless b.respond_to?(:value)
    a.get_method(method: b.value)
  }
  VALUE = :"."
end

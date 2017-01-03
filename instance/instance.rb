class Instance
  module Functions
    module_function

    def __get_attr__(cls:, attribute: )
      cls.respond_to?(attribute) ? cls.method(attribute) : nil
    end
  end

  def __get_attr__(attribute:)
    self.class::Functions.__get_attr__(cls: self, attribute: attribute) || Instance::Identifier::Nil.new
  end
end
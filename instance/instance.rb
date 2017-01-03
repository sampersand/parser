class Instance
  module Functions
  end

  def get_method(method:)
    self.respond_to?(method) ?
      Instance::Function.new(func: method(method)) : 
      nil
  end
end
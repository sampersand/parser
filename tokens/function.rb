require_relative 'token'
class Function < Identifier

  def initialize(func: nil, **args)
    super(**args)
    @func = func # doesn't check for nil b/c operator makes its own func
  end

  def func
    @func
  end

  def call(locals:)
    func.call(locals: locals)
  end

end

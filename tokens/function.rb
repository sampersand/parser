require_relative 'token'
class Function < Identifier

  def initialize(func:, **k)
    super(**k)
    @func = func
  end

  def call(locals:)
    @func.call(locals: locals)
  end

end

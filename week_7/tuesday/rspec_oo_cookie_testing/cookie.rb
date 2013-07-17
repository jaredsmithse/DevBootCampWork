class Cookie
  attr_reader :type

  def initialize(type)
    @type = type
    @time_baked = 0
  end

  def bake!(time)
    @time_baked += time
    self
  end

  def status
    case
    when @time_baked < 7
      :doughy
    when @time_baked < 10
      :almost_ready
    when @time_baked < 12
      :ready
    when @time_baked >= 12
      :burned
  #   else
  #     raise "Cookie does not have a status"
    end
  end
end
class Spot
  def initialize(size:, level:)
    @size = size
    @level = level
    @available = true
  end

  def claim
    self.available = false
  end
end
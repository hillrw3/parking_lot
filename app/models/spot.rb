require 'securerandom'

class Spot
  attr_reader :id

  def initialize(size:, level:, id: SecureRandom.hex(5))
    @size = size
    @level = level
    @id = id
    @available = true
  end
end
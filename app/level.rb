class Level
  attr_reader :spots

  def initialize(spots)
    @spots = spots
  end

  def find_available_spot(vehicle)
    spots.select {|spot| spot.available?(vehicle)}.any?
  end
end
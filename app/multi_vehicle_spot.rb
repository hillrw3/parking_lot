class MultiVehicleSpot
  attr_reader :size

  def initialize
    @size = 50
  end

  def fill_spot(*vehicles)
    vehicle_combinations = vehicle_combinations_that_fit(vehicles)
    combination_with_most_profit(vehicle_combinations)
  end

  private

  def combination_with_most_profit(vehicle_combos)
    vehicle_combos.sort_by { |vehicle_set| vehicle_set.map(&:cost).sum }.last
  end

  def vehicle_combinations_that_fit(vehicles)
    combos_of_appropriate_size = []

    (vehicles.length + 1).times do |i|
      combinations = vehicles.combination(i).to_a
      combinations.each do |combination|
        combos_of_appropriate_size << combination if vehicle_combo_fits(combination)
      end
    end

    combos_of_appropriate_size
  end

  def vehicle_combo_fits(combination)
    combination.map(&:size).sum <= self.size
  end
end

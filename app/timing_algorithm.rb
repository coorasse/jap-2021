class TimingAlgorithm
  def initialize(world)
    puts world.simulation_time

    world.cars.each do |car|
      car.streets do |streets|
        world.intersection[streets.start].timing[0] = world.intersection[streets.start].timing[0] + 1

        world.intersection[streets.end].timing[streets.lenght] = world.intersection[streets.start].timing[0] + 1
      end
    end

    world.intersections.each do |id, intersection|
      total_cars = intersection.in_streets.sum { |s| s.cars.count }
      next if total_cars == 0

      intersection.in_streets.sort_by { |s| s.cars.count }.reverse.each do |street|
        next if street.cars.count == 0
        # loops = intersection.in_streets.count
        loops = 10
        weight_of_street_on_interception = (total_cars.to_f / street.cars.count)
        time = (world.simulation_time / weight_of_street_on_interception / loops).to_f.ceil
        time = time == 0 ? 1 : time
        intersection.schedule_entries << ScheduleEntry.new(street_name: street.name, duration: time)
      end
    end
  end
end

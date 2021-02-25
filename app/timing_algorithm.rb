class TimingAlgorithm
  def initialize(world)
    puts world.simulation_time

    world.intersections.each do |(id, intersection)|
      # puts '-- Intersection --'
      total = intersection.in_streets.sum { |s| s.cars_count }
      if total == 0
        intersection.schedule_entries << ScheduleEntry.new(street_name: intersection.in_streets.first.name, duration: 1)
      end
      intersection.in_streets.sort_by(&:cars_count).reverse.each do |street|
        if street.cars_count != 0
          n = ((total * 1.0 / street.cars_count) / 3).to_f.ceil
          d = n == 0 ? 1 : n
          intersection.schedule_entries << ScheduleEntry.new(street_name: street.name, duration: d)
        end
      end
    end
  end
end

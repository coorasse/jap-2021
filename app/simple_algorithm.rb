class SimpleAlgorithm
  def initialize(world)
    @world = world

    @world.intersections.values.each do |intersection|
      intersection.in_streets.each do |street|
        intersection.schedule_entries << ScheduleEntry.new(street_name: street.name, duration: 5) unless street.cars_count == 0
      end
    end
  end
end

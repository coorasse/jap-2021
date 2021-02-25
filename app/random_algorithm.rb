class RandomAlgorithm
  def initialize(world)
    @world = world

    @world.intersections.each do |intersection|
      intersection.in_streets.each do |street|
        intersection.schedule_entries << ScheduleEntry.new(street_name: street.name, duration: 2)
      end
    end
  end
end

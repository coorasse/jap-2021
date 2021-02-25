class RandomAlgorithm
  attr_accessor :world

  def initialize(world)
    @world = world
    random_schedule
  end

  private

  def random_schedule
    @world.intersections.each do |(id, intersection)|
      streets = intersection.in_streets
                            .sort_by { |street| street.cars.count }
                            .select { |street| street.cars.count.positive? }
                            .reverse

      streets.each_with_index do |street, i|
        x = street.cars.count.to_f
        duration = (0.00004667*x*x+0.007667*x+0.5000).ceil
        intersection.schedule_entries << ScheduleEntry.new(street_name: street.name, duration: duration)
      end

      if intersection.schedule_entries.empty?
        intersection.schedule_entries << ScheduleEntry.new(street_name: intersection.in_streets.first.name, duration: 1)
      end
    end
  end
end

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
                            .sort_by { |street| street.cars_count }
                            .select { |street| street.cars_count.positive? }
                            .reverse

      streets.each_with_index do |street, i|
        duration = case street.cars_count
                   when 0..10
                     1
                   when 11..100
                     2
                   else
                     4
                   end

        intersection.schedule_entries << ScheduleEntry.new(street_name: street.name, duration: duration)
      end

      if intersection.schedule_entries.empty?
        intersection.schedule_entries << ScheduleEntry.new(street_name: intersection.in_streets.first.name, duration: 1)
      end
    end
  end
end

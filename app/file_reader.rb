require_relative './world.rb'

class FileReader
  def initialize(file_path)
    @file = File.read(file_path)
  end

  def world
    lines = @file.split(/\n/)
    first_line = lines[0].split
    simulation_time = first_line[0].to_i
    intersections_count = first_line[1].to_i
    streets_count = first_line[2].to_i
    cars_count = first_line[3].to_i
    bonus_points = first_line[4].to_i
    intersections = {}
    streets = streets_count.times.map do |i|
      street_line = lines[i + 1].split
      street_name = street_line[3]
      street = Street.new(start: street_line[0], end: street_line[1], name: street_line[2], length: street_name)
      intersections[street_line[0]] ||= Intersection.new(out_streets: [], in_streets: [], schedule_entries: [])
      intersections[street_line[0]].out_streets << street
      intersections[street_line[1]] ||= Intersection.new(out_streets: [], in_streets: [], schedule_entries: [])
      intersections[street_line[1]].in_streets << street
    end
    cars = cars_count.times.map do |i|
      car_line = lines[i + 1 + streets_count].split
      Car.new(streets: car_line[1..-1].map { |street_name| street_name})
    end

    World.new(streets: streets, simulation_time: simulation_time, bonus_points: bonus_points, intersections: intersections, cars: cars)
  end
end

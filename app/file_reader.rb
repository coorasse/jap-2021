require_relative './world.rb'

class FileReader
  def initialize(file_path)
    @file = File.read(file_path)
  end

  def world
    lines = @file.split(/\n/)
    first_line = lines[0].split
    nodes_count = first_line[0].to_i
    streets_count = first_line[1].to_i
    time_budget = first_line[2].to_i
    cars_count = first_line[3].to_i
    starting_node = first_line[4].to_i
    nodes = nodes_count.times.map do |i|
      node_line = lines[i + 1].split
      Node.new(latitude: node_line[0], longitude: node_line[1], index: i)
    end

    World.new(nodes: nodes, streets: [], cars: [])
  end
end

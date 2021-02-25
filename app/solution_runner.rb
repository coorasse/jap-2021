require_relative 'file_reader'
require_relative 'simple_algorithm'
require_relative 'file_writer'

class SolutionRunner
  def self.run
    file_names = %w[d]
    file_names.each do |file_name|
      world = FileReader.new("input_sets/#{file_name}.txt").world
      solution = SimpleAlgorithm.new(world)
      solution.run
      FileWriter.new(world, "output_sets/#{file_name}.txt")
    end
    nil
  end
end

SolutionRunner.run
exit

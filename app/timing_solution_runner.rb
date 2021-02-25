require_relative 'file_reader'
require_relative 'simple_algorithm'
require_relative 'timing_algorithm'
require_relative 'file_writer'

class SolutionRunner
  def self.run
    file_names = %w[a b c d e f]
    file_names.each do |file_name|
      world = FileReader.new("input_sets/#{file_name}.txt").world
      TimingAlgorithm.new(world)
      puts "Running #{file_name}.txt"
      FileWriter.new(world.intersections.values, "output_sets/#{file_name}.txt").write_out
    end
  end
end

SolutionRunner.run

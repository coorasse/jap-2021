class SolutionRunner
  def self.run
    file_names = %w[a b c d e f]
    file_names.each do |file_name|
      world = FileReader.new("input_sets/#{file_name}.txt").world
      solution = SimpleAlgorithm.new(world)
      solution.run
      FileWriter.new(world, "output_sets/#{file_name}.txt")
    end
  end
end

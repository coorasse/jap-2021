require_relative '../app/file_reader.rb'

RSpec.describe 'stats' do
  it 'generates statistics' do
    file_names = %w[a b c d e f]
    file_names.each do |file_name|
      world = FileReader.new("input_sets/#{file_name}.txt").world
      File.open("stats/#{file_name}.txt", 'w') do |file|
        file.puts "all streets: #{world.streets.keys.length}"
        file.puts "no cars: #{world.streets.values.select { |street| street.cars.length == 0 }.length}"
        file.puts "#{world.streets.values.select { |street| street.cars.length == 0 }.length / world.streets.keys.length.to_f * 100}%"
        file.puts "with one: #{world.streets.values.select { |street| street.cars.length == 1 }.length}"
        file.puts "#{world.streets.values.select { |street| street.cars.length == 1 }.length / world.streets.keys.length.to_f * 100}%"
        file.puts "with one going through only one: #{world.streets.values.select { |street| street.cars.length == 1 && street.cars[0].streets.length == 1 }.length / world.streets.length.to_f * 100}"
        file.puts "cars with one street: #{world.cars.select { |car| car.streets.length <= 2 }.length / world.cars.length.to_f * 100}"

        # world.streets.each do |street_name, street|
        #   file.puts "#{street_name}, #{street.cars.length}"
        # end
      end
    end
  end
end

require_relative '../app/file_reader.rb'

RSpec.describe 'stats' do
  it 'generates statistics' do
    file_names = %w[a b c d e f]
    file_names.each do |file_name|
      world = FileReader.new("input_sets/#{file_name}.txt").world
      File.open("stats/#{file_name}.txt", 'w') do |file|
        file.puts "#{world.streets.keys.length}"
        file.puts "#{world.streets.values.select { |street| street.cars_count == 0 }.length}"
        file.puts "#{world.streets.values.select { |street| street.cars_count == 0 }.length / world.streets.keys.length.to_f * 100}%"
        # world.streets.each do |street_name, street|
        #   file.puts "#{street_name}, #{street.cars_count}"
        # end
      end
    end
  end
end

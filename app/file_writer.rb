# frozen_string_literal: true
class FileWriter
  def initialize(intersections, output_path)
    @intersections = intersections
    @output_path = output_path
  end

  def write_out
    File.open(@output_path, 'w') do |file|
      file.puts @intersections.length
      @intersections.each do |intersection|
        file.puts intersection.id
        file.puts intersection.schedule_entries.length
        intersection.schedule_entries.each do |entry|
          file.puts "#{entry.street_name} #{entry.duration}"
        end
      end
    end
  end
end

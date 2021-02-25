# frozen_string_literal: true
class FileWriter
  def initialize(intersections, output_path)
    @intersections = intersections
    @output_path = output_path
  end

  def write_out
    File.open(@output_path, 'w') do |file|
      valid_intersections = @intersections.select { |i| i.schedule_entries.length > 0 }
      file.puts valid_intersections.length
      valid_intersections.each do |intersection|
        file.puts intersection.id
        file.puts intersection.schedule_entries.length
        intersection.schedule_entries.each do |entry|
          file.puts "#{entry.street_name} #{entry.duration}"
        end
      end
    end
  end
end

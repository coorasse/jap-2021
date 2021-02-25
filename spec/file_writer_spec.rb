require_relative '../app/file_writer'
require_relative '../app/world'

RSpec.describe FileWriter do
  it 'works for a simple file' do
    intersections = [
      Intersection.new(id: 3, schedule_entries: [
        ScheduleEntry.new(street_name: 'A', duration: 1),
        ScheduleEntry.new(street_name: 'B', duration: 2),
        ScheduleEntry.new(street_name: 'C', duration: 5)
      ])
    ]

    FileWriter.new(intersections, 'output_sets/test.txt').write_out
  end
end

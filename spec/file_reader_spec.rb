require_relative '../app/file_reader.rb'

RSpec.describe FileReader do
  it 'works for a simple file' do
    world = FileReader.new('input_sets/a.txt').world
    expect(world.simulation_time).to eq(6)
    expect(world.intersections.keys.length).to eq(4)
    expect(world.streets.length).to eq(5)
    expect(world.cars.length).to eq(2)
    expect(world.bonus_points).to eq(1000)
    expect(world.cars[0].streets.length).to eq(4)
    expect(world.cars[1].streets.length).to eq(3)
    # expect(world.nodes[1].streets_leaving.count).to eq(1)
    # expect(world.nodes[2].streets_leaving.count).to eq(1)
    # expect(world.cars[0].nodes[0]).to eq 0
  end
end

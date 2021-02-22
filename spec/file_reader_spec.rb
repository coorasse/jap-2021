require_relative '../app/file_reader.rb'

RSpec.describe FileReader do
  it 'works for a simple file' do
    sleep 30
    world = FileReader.new('input_sets/simple.in').world
    expect(world.cars.count).to eq(2)
    expect(world.streets.count).to eq(3)
    expect(world.nodes.count).to eq(3)
    expect(world.nodes[0].streets_leaving.count).to eq(1)
    expect(world.nodes[1].streets_leaving.count).to eq(1)
    expect(world.nodes[2].streets_leaving.count).to eq(1)
    expect(world.cars[0].nodes[0]).to eq 0
  end
end

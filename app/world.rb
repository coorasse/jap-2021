require 'ostruct'

class ClosedStruct
  def initialize(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end

class ScheduleEntry < ClosedStruct
  attr_accessor :street_name, :duration
end

class Intersection < ClosedStruct
  attr_accessor :schedule_entries
end

class Street < ClosedStruct
  attr_accessor :length, :start, :end
end

class Car
  attr_accessor :time_budget, :nodes, :streets

  def initialize(time_budget, initial_node)
    self.time_budget = time_budget
    self.nodes = []
    self.streets = []
    nodes << initial_node
  end

  def location
    nodes.last
  end
end

class World < ClosedStruct
  attr_accessor :streets, :cars, :intersections, :simulation_time, :bonus_points

  def initialize(args)
    super(args)
    # streets.each do |street|
    #   street.node_a.streets_leaving << street
    # end
  end
end

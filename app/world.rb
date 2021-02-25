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
  attr_accessor :id, :schedule_entries, :out_streets, :in_streets
end

class Street < ClosedStruct
  attr_accessor :length, :name, :start, :end, :cars_count #start, end are IDs of intersections
end

class Car < ClosedStruct
  attr_accessor :streets
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

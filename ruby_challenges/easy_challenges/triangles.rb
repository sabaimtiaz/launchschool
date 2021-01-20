class Triangle
  attr_accessor :angles

  def initialize(angle1, angle2, angle3)
    @angles = [angle1, angle2, angle3]
    raise ArgumentError if is_invalid?
  end

  def is_invalid?
    @angles.any? { |elem| elem <= 0 } || !sum_combos?
  end

  def find_combos
    combos = []
    counter = 0
    angles.size.times do
      angles.each.with_index do |elem, idx|
        combos << [angles[counter], angles[idx]].sort.sum unless (angles[counter] == elem && angles.count(elem) == 1)
      end
      counter += 1 
    end
    combos.uniq
  end

  def sum_combos?
    res = 0
    combinations = find_combos
    combinations.each.with_index do |elem, idx|
       res = false if angles.any? {|item| elem < item }
    end
    res
  end

  def kind
    case angles.uniq.size
    when 1
      "equilateral"
    when 2
      "isosceles"
    when 3
      "scalene"
    end
  end
end



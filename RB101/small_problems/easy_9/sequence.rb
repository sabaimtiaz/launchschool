def sequence(count, firstseq)
  (1..count).map { |index| index * firstseq}
end
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

def sequence(count, first)
  (1..count).map do |num|
    num * first
  end
end
sequence(4, -7)